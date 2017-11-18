FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/build-manager.git && \
    cd build-manager && \
    git pull && \
    npm install --unsafe-perm

WORKDIR build-manager

COPY config.json config.json

CMD ["npm", "start"]