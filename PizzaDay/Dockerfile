FROM ubuntu:15.10

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODEJS_VERSION=4.4.2 \
    PATH=$PATH:/opt/node/bin

WORKDIR /opt/node

RUN apt-get update && \
    apt-get install -y curl ca-certificates --no-install-recommends && \
    curl -sL https://nodejs.org/dist/v${NODEJS_VERSION}/node-v${NODEJS_VERSION}-linux-x64.tar.gz | tar xz --strip-components=1 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean

RUN add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y git && \
    git clone --progress --verbose https://github.com/josselinbuils/PizzaDay.git && \
    cd PizzaDay && \
    npm install -g npm && \
    npm install

WORKDIR PizzaDay

EXPOSE 9000

CMD [ "npm", "start" ]