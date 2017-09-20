FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODE_ENV production

RUN git clone --progress --verbose https://github.com/josselinbuils/teravia.git && \
    cd teravia && \
    git pull

RUN npm install -g npm && \
    npm install

RUN npm run build

WORKDIR teravia

EXPOSE 80

CMD ["npm", "start"]