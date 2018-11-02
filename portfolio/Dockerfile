FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone https://github.com/josselinbuils/portfolio.git && \
    cd portfolio && \
    npm install --production && \
    npm run build

WORKDIR portfolio

COPY config.json server/config.json

CMD ["npm", "start"]
