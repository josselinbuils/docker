FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/path-finding.git && \
    cd path-finding && \
    git pull && \
    npm install

WORKDIR path-finding

CMD ["npm", "start"]
