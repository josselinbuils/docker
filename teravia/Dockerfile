FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

ENV NODE_ENV production

# Install teravia
RUN git clone --progress --verbose https://github.com/josselinbuils/teravia.git && \
    cd teravia && \
    git pull && \
    npm install -g npm && \
    npm install && \
    npm run build

WORKDIR teravia

EXPOSE 80

CMD ["npm", "start"]