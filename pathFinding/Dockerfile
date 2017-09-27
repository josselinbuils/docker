FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/pathFinding.git && \
    cd pathFinding && \
    git pull && \
    npm install --unsafe-perm

WORKDIR pathFinding

CMD ["npm", "start"]
