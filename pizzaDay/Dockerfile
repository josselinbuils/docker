FROM node:6

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install PizzaDay
RUN git clone --progress --verbose https://github.com/josselinbuils/pizzaDay.git && \
    cd pizzaDay && \
    git pull && \
    npm install --unsafe-perm && \
    npm run build

WORKDIR pizzaDay

COPY config.json server/config.json

CMD ["npm", "start"]