FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/portfolio.git && \
    cd portfolio && \
    git pull && \
    npm install --unsafe-perm && \
    npm run build

WORKDIR portfolio

COPY config.json server/config.json

CMD ["npm", "start"]
