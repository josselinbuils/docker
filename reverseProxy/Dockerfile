FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install ReverseProxy
RUN git clone --progress --verbose https://github.com/josselinbuils/reverseProxy.git && \
    cd reverseProxy && \
    git pull && \
    npm install --unsafe-perm

WORKDIR reverseProxy

COPY config.json config.json

CMD ["npm", "start"]