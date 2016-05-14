FROM ubuntu:16.04

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install MALV-API
RUN chmod -R 777 /bin && /
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