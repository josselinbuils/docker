FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/build-manager.git && \
    cd build-manager && \
    git pull && \
    npm install

WORKDIR build-manager

COPY config.json config.json

CMD ["npm", "start"]