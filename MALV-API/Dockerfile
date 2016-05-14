FROM scratch

ADD ubuntu-xenial-core-cloudimg-amd64-root.tar.gz /

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    apt-get update && /
    apt-get install -y git && /
    rm -rf /var/lib/apt/lists/* && \
    git clone --progress --verbose https://github.com/josselinbuils/MALV-API.git && \
    cd MALV-API && \
    git pull && \
    npm install -g npm && \
    npm install

WORKDIR MALV-API

COPY config.json config.json

EXPOSE 8080

CMD ["npm", "start"]