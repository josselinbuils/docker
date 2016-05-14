FROM buildpack-deps:xenial

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install git
RUN apt-get update \
    && apt-get install -y git

# Install MALV-API
RUN git clone --progress --verbose https://github.com/josselinbuils/MALV-API.git && \
    cd MALV-API && \
    git pull && \
    npm install -g npm && \
    npm install

WORKDIR MALV-API

COPY config.json config.json

EXPOSE 8080

CMD ["npm", "start"]