FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone https://github.com/josselinbuils/reverse-proxy.git && \
    cd reverse-proxy && \
    npm install

WORKDIR reverse-proxy

COPY config.json config.json

CMD ["npm", "start"]
