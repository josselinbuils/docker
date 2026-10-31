# docker

This repository contains docker configuration files which allows to run my applications on my VPS.

### Run

  - `docker-compose up -d`

### Build

 - `docker-compose build --force-rm --no-cache service`

### Volleyball stats

`volleyball-stats/nginx.conf` serves the match pages. The rest of the folder stays on the VPS: `site/`
(uploaded by the volleyball-stats repo), `video_key.conf` (the video password's key) and `feedback/`.

### Monitoring

`monitoring/vbs-monitor.sh` logs the CPU, the reverse proxy's and nginx's state every minute to
`/var/log/vbs-monitor/summary.log`, and a snapshot of what is busy when the CPU is
(`/var/log/vbs-monitor/snapshots/`). Install:

```bash
cp monitoring/vbs-monitor.sh /usr/local/bin/ && cp monitoring/vbs-monitor.cron /etc/cron.d/vbs-monitor
```

### Docker commands

- List main images: `docker images`

- List all images: `docker images -a`

- Stop/remove all containers/images: `docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi -f $(docker images -q)`

- Remove an image: `docker rmi -f id/name`

- Remove all images: `docker rmi -f $(docker images -q)`

- List running containers: `docker ps`

- List all containers: `docker ps -a`

- Stop all containers: `docker stop $(docker ps -a -q)`

- Remove a container: `docker rm id/name`

- Remove all containers: `docker rm $(docker ps -a -q)`

- Access a container bash: `docker exec -i -t id/name bash`

- Leave a container bash: `exit`

- Get logs from a container: `docker logs [-f] id/name`

- List open ports on Ubuntu: `netstat -tulnp`
