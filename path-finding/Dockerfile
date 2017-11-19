FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone https://github.com/josselinbuils/path-finding.git && \
    cd path-finding && \
    npm install

WORKDIR path-finding

CMD ["npm", "start"]
