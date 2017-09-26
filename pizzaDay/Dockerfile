FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODE_ENV production

# Install PizzaDay
RUN git clone --progress --verbose https://github.com/josselinbuils/pizzaDay.git && \
    cd pizzaDay && \
    git pull && \
    npm install -g npm && \
    npm install --unsafe-perm && \
    npm install -g gulp && \
    gulp build.prod

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org && \
    rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

WORKDIR pizzaDay

COPY config.json server/config.json

EXPOSE 9000

CMD ["npm", "start"]