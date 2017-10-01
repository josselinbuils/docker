FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/buildManager.git && \
    cd buildManager && \
    git pull && \
    npm install --unsafe-perm

WORKDIR buildManager

COPY config.json config.json

CMD ["npm", "start"]