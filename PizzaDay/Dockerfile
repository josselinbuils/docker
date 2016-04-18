FROM nodesource/vivid:4.4.2

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN apt-get update && \
    && apt-get install -y git
    git clone --progress --verbose https://github.com/josselinbuils/PizzaDay.git && \
    cd PizzaDay && \
    npm install -g npm && \
    npm install

WORKDIR PizzaDay

EXPOSE 9000

CMD [ "npm", "start" ]