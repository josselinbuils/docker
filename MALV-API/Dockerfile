FROM scratch

ADD ubuntu-xenial-core-cloudimg-amd64-root.tar.gz /

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org
    rm -rf /var/lib/apt/lists/*

RUN chmod 777 -R /var/lib/apt/ && \
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