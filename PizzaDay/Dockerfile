FROM nodesource/trusty:4.4.2

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN apt-get update
RUN apt-get install -y git
RUN \
   git clone --progress --verbose https://github.com/josselinbuils/PizzaDay.git && \
   cd PizzaDay && \
   npm install -g npm && \
   npm install

EXPOSE 9000

CMD [ "npm", "start" ]