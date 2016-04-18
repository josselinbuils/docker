FROM nodesource/vivid:4.4.2

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

RUN apt-get update
RUN apt-get install -y git
RUN git clone --progress --verbose https://github.com/josselinbuils/MALV-API.git && \
    cd MALV-API && \
    npm install -g npm && \
    npm install

WORKDIR MALV-API

COPY MALV-API/config.json .

EXPOSE 8080

CMD ["npm", "start"]