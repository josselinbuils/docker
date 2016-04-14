FROM nodesource/trusty:4.4.2

MAINTAINER Josselin Buils <josselin.buils@gmail.com>

# Get PizzaDay source files
RUN apt-get update
RUN apt-get install -y git
RUN git clone https://github.com/josselinbuils/PizzaDay.git

# Install node dependencies
RUN cd /PizzaDay
RUN npm install

# Expose ports
EXPOSE 9000
EXPOSE 27017

# Run PizzaDay
CMD [ "npm", "start" ]