FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODE_ENV production

# Install ReverseProxy
RUN git clone --progress --verbose https://github.com/josselinbuils/reverseProxy.git && \
    cd reverseProxy && \
    git pull && \
    npm install -g npm && \
    npm install --unsafe-perm

WORKDIR reverseProxy

COPY config.json config.json

EXPOSE 80
EXPOSE 443

CMD ["npm", "start"]