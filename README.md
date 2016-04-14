# docker

## Images

### MongoDB

- Go to docker/MongoDB
- Run `docker build -t mongodb .`
- Run `docker run --name mongo-dev -d -v /opt/mongodb/db:/data/db mongodb`

### PizzaDay

- Go to docker/PizzaDay
- Run `docker build -t pizzaday .`
- Run `docker run --name pizzaDay -d --link mongo-dev:mongo-dev pizzaday`

## Docker commands

#### List main images
`docker image`

#### List running containers
`docker ps`

#### List all containers
`docker ps -a`

#### Force to remove an image and its containers
`docker rmi -f [id/name]`