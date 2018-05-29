FROM node:8

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Install PizzaDay
RUN git clone https://github.com/josselinbuils/tournoi-volley.git && \
    cd tournoi-volley && \
    npm install

WORKDIR tournoi-volley

COPY .env .env

CMD ["npm", "start"]
