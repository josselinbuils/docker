# docker

This repository contains docker configuration files which allow to run my node applications using a Ubuntu 15.04 server.

### Configuration

  - Create a config.json file in docker/MALV-API

### Run

  - `docker-compose up -d`

### Build without cache

  - `docker-compose build --no-cache [service]`

### Run manually

- MALV-API

  - `docker build -t malvapi ./MALV-API`
  - `docker run --name MALVAPI -d -p 8080:8080 malvapi`

- MongoDB

  - `docker build -t mongodb ./MongoDB`
  - `docker run --name MongoDB -d -v /opt/mongodb/db:/data/db mongodb`

- PizzaDay

  - `docker build -t pizzaday ./PizzaDay`
  - `docker run --name PizzaDay -d --link MongoDB:MongoDB -p 9000:9000 pizzaday`

### Docker commands

- List main images: `docker images`

- List all images: `docker images -a`

- List running containers: `docker ps`

- List all containers: `docker ps -a`

- Remove an image and its containers: `docker rmi -f [id/name]`

- Access a container bash: `docker exec -i -t [id/name] bash`

- Leave a container bash: `exit`

- Get logs from a container: `docker logs [id/name]`

- List open ports on Ubuntu: `netstat -tulnp`