#!/bin/bash
# Run every minute by /etc/cron.d/vbs-monitor. Appends one line to /var/log/vbs-monitor/summary.log:
# CPU busy over 5 s, the reverse proxy's and the volleyball nginx workers' CPU, the proxy's socket
# states, nginx's requests in progress, sshd logins in progress and the top processes. When the CPU is
# busy, saves a snapshot in /var/log/vbs-monitor/snapshots/: processes, sockets, the syscalls the
# busy processes make, the proxy's node report (JS stack, handles) and the containers' recent logs.
set -u
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

DIR=/var/log/vbs-monitor
REPORTS=/home/ubuntu/docker/reverse-proxy/reports
BUSY_CPU=${BUSY_CPU:-80}       # % of all cores, over the sample
BUSY_PROC=${BUSY_PROC:-40}     # % of one core, for the proxy or one nginx worker
SNAP_EVERY=${SNAP_EVERY:-600}  # seconds between two snapshots
KEEP=40          # snapshots kept
mkdir -p "$DIR/snapshots"

proxy=$(pgrep -n -x -f '(/usr/local/bin/)?node dist/proxy.js')
master=$(docker inspect -f '{{.State.Pid}}' docker-volleyballstats-1 2>/dev/null)
workers=$( [ -n "$master" ] && pgrep -P "$master" | tr '\n' ' ')

frame=$(top -bn2 -d5 -w 512 -o %CPU | awk '/^top -/{n++} n==2')
busy=$(awk -F'[ ,]+' '/^%Cpu/{for (i = 1; i <= NF; i++) if ($i == "id") print int(100 - $(i - 1))}' <<< "$frame")
pcpu() { awk -v p="$1" '/^ *PID/{h=1; next} h && $1 == p {print int($9); f=1} END {if (!f) print 0}' <<< "$frame"; }
top5=$(awk '/^ *PID/{h=1; next} h && n < 5 {printf "%s/%s/%s ", $1, $12, $9; n++}' <<< "$frame")

proxy_pct=$( [ -n "$proxy" ] && pcpu "$proxy" || echo 0)
max_proc=$proxy_pct
nginx_pct=""
for w in $workers; do
  v=$(pcpu "$w")
  nginx_pct+="$v,"
  [ "$v" -gt "$max_proc" ] && max_proc=$v
done
states=$( [ -n "$proxy" ] && nsenter -t "$proxy" -n ss -tan 2>/dev/null | awk 'NR > 1 {c[$1]++} END {for (s in c) printf "%s=%d ", s, c[s]}')
status=$(docker exec docker-volleyballstats-1 wget -qO- http://127.0.0.1/volleyball/nginx-status 2>/dev/null | tr '\n' ' ' | tr -s ' ')
logins=$(pgrep -c -f '^sshd: .*\[(net|accepted|priv)\]$')

echo "$(date -u +%FT%TZ) load=$(cut -d' ' -f1 /proc/loadavg) cpu=${busy}% proxy=${proxy_pct}% nginx=${nginx_pct%,}% proxy_sockets=[${states% }] nginx=[${status% }] ssh_logins=$logins top=[${top5% }]" >> "$DIR/summary.log"

last=$(cat "$DIR/last_snapshot" 2>/dev/null || echo 0)
if { [ "$busy" -ge "$BUSY_CPU" ] || [ "$max_proc" -ge "$BUSY_PROC" ]; } && [ $(( $(date +%s) - last )) -ge "$SNAP_EVERY" ]; then
  date +%s > "$DIR/last_snapshot"
  s="$DIR/snapshots/$(date -u +%Y%m%d-%H%M%S)"
  mkdir -p "$s"
  echo "$frame" > "$s/top.txt"
  ps -eLo pid,tid,stat,pcpu,etime,time,wchan:32,args --sort=-pcpu | head -80 > "$s/threads.txt"
  vmstat 1 5 > "$s/vmstat.txt"
  docker stats --no-stream > "$s/docker_stats.txt" 2>&1
  for p in $proxy $workers $(pgrep -f '^sshd: .*\[(net|accepted|priv)\]$'); do
    {
      echo "== $p $(tr '\0' ' ' < "/proc/$p/cmdline")"
      grep -E '^(State|Threads|voluntary|nonvoluntary)' "/proc/$p/status"
      echo "wchan: $(cat "/proc/$p/wchan")"
      cat "/proc/$p/stack"
      echo "open files: $(ls "/proc/$p/fd" | wc -l)"
    } >> "$s/procs.txt" 2>&1
  done
  [ -n "$proxy" ] && nsenter -t "$proxy" -n ss -tanpie > "$s/proxy_sockets.txt" 2>&1
  [ -n "$master" ] && nsenter -t "$master" -n ss -tanpie > "$s/nginx_sockets.txt" 2>&1
  echo "$status" > "$s/nginx_status.txt"
  # Which syscalls the busy processes make: counts over 10 s, then 2 s of the calls themselves.
  busy_pids=""
  for p in $proxy $workers; do [ "$(pcpu "$p")" -ge 10 ] && busy_pids+="$p "; done
  for p in $busy_pids; do timeout -s INT 10 strace -c -f -p "$p" -o "$s/strace_count_$p.txt" > /dev/null 2>&1 & done
  wait
  for p in $busy_pids; do timeout -s INT 2 strace -tt -T -f -p "$p" -o "$s/strace_$p.txt" > /dev/null 2>&1 & done
  wait
  for f in "$s"/strace_[0-9]*.txt; do [ -f "$f" ] && head -3000 "$f" > "$f.cut" && mv "$f.cut" "$f"; done
  # The proxy's JavaScript stack and open handles: node --report-on-signal (NODE_OPTIONS) on SIGUSR2,
  # only when the proxy was started with it (else SIGUSR2 would stop it).
  if [ -n "$proxy" ] && tr '\0' '\n' < "/proc/$proxy/environ" | grep -q -- '--report-on-signal'; then
    kill -USR2 "$proxy"
    sleep 5
    report=$(ls -t "$REPORTS"/*.json 2>/dev/null | head -1)
    [ -n "$report" ] && cp -p "$report" "$s/"
    ls -t "$REPORTS"/*.json 2>/dev/null | tail -n +21 | xargs -r rm -f
  fi
  docker logs --since 20m docker-reverseproxy-1 > "$s/proxy.log" 2>&1
  docker logs --since 20m docker-volleyballstats-1 > "$s/nginx.log" 2>&1
  journalctl -u ssh --since -20min --no-pager 2>/dev/null | tail -300 > "$s/sshd.log"
  ls -dt "$DIR"/snapshots/*/ | tail -n +$((KEEP + 1)) | xargs -r rm -rf
fi

# About 400 bytes a minute: rotated at 20 MB (about 5 weeks), the previous file kept.
[ "$(stat -c %s "$DIR/summary.log")" -gt 20000000 ] && mv "$DIR/summary.log" "$DIR/summary.log.1"
exit 0
