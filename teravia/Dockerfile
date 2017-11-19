FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone https://github.com/josselinbuils/teravia.git && \
    cd teravia && \
    npm install && \
    npm run build

WORKDIR teravia

CMD ["npm", "start"]
