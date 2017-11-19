FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install PizzaDay
RUN git clone --progress --verbose https://github.com/josselinbuils/pizza-day.git && \
    cd pizza-day && \
    git pull && \
    npm install && \
    npm run build

WORKDIR pizza-day

COPY config.json server/config.json

CMD ["npm", "start"]