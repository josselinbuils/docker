FROM nodesource/vivid:4.4.2

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN apt-get update && \
    apt-get install -y git && \
    git clone --progress --verbose https://github.com/josselinbuils/PizzaDay.git && \
    cd PizzaDay && \
    npm install -g npm && \
    npm install

WORKDIR PizzaDay

COPY config.json server/config.json

CMD ["npm", "start"]

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
    apt-get update && \
    apt-get install -y mongodb-org

VOLUME ["/data/db"]
WORKDIR /data

EXPOSE 27017

CMD ["mongod", "--smallfiles"]