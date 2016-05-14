FROM scratch

# delete all the apt list files since they're big and get stale quickly
RUN apt-get update && /
    apt-get install -y git && /
    rm -rf /var/lib/apt/lists/* && \
    git clone --progress --verbose https://github.com/josselinbuils/MALV-API.git && \
    cd MALV-API && \
    git pull && \
    npm install -g npm && \
    npm install

WORKDIR MALV-API

COPY config.json config.json

EXPOSE 8080

CMD ["npm", "start"]