# docker

## MongoDB

- Go to docker/MongoDB
- Run `docker build -t mongodb .`
- Run `docker run --name mongo-dev -d -v /opt/mongodb/db:/data/db mongodb`

## PizzaDay

- Go to docker/PizzaDay
- Run `docker build -t pizzaday .`
- Run `docker run --name pizzaDay -d --link mongo-dev:mongo-dev pizzaday`