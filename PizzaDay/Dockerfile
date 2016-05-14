FROM node:4.4.4

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install PizzaDay
RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/* && \
    git clone --progress --verbose https://github.com/josselinbuils/PizzaDay.git && \
    cd PizzaDay && \
    git pull && \
    npm install -g npm && \
    npm install

# Install MongoDB
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org
    rm -rf /var/lib/apt/lists/*

VOLUME ["/data/db"]

WORKDIR PizzaDay

COPY config.json server/config.json

EXPOSE 9000

CMD ["npm", "start"]