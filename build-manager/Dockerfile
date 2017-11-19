FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone https://github.com/josselinbuils/build-manager.git && \
    cd build-manager && \
    npm install

WORKDIR build-manager

COPY config.json config.json

CMD ["npm", "start"]