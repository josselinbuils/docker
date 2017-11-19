FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/reverse-proxy.git && \
    cd reverse-proxy && \
    git pull && \
    npm install

WORKDIR reverse-proxy

COPY config.json config.json

CMD ["npm", "start"]