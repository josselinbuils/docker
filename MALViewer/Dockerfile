FROM buildpack-deps:xenial

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODE_VERSION 4.4.4

# Install Node.js
RUN set -ex && \
    for key in \
        9554F04D7259F04124DE6B476D5A82AC7E37093B \
        94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
        0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
        FD3A5288F042B6850C66B31F09FE44734EB7990E \
        71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
        DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
        B9AE9905FFD7803F25714661B63B535A4C206CA9 \
        C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    ; do \
        gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
    done && \
    curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" && \
    tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 && \
    rm -rf "node-v$NODE_VERSION-linux-x64.tar.xz"

# Install MALViewer
RUN git clone --progress --verbose https://github.com/josselinbuils/MALViewer.git && \
    cd MALViewer && \
    git pull && \
    npm install -g npm && \
    npm install && \
    npm install -g bower && \
    bower install --allow-root

WORKDIR MALViewer

EXPOSE 9000

CMD ["npm", "start"]