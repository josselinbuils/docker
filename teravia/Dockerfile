FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN git clone --progress --verbose https://github.com/josselinbuils/teravia.git && \
    cd teravia && \
    git pull && \
    npm install --unsafe-perm && \
    npm run build

WORKDIR teravia

CMD ["npm", "start"]
