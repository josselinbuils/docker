# docker

## MongoDB

- Go to docker/MongoDB
- Run `docker build -t mongodb .`
- Run `docker run --name mongo-dev -d -v /opt/mongodb/db:/data/db -p 27016:27017 mongodb`

## PizzaDay

- Go to docker/PizzaDay
- Run `docker build -t pizzaday .`
- Run `docker run --name pizzaDay -d -p 9000:9000 -p 27016:27017 pizzaday`