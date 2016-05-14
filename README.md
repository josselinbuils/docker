# docker

This repository contains docker configuration files which allow to run my node applications using a Ubuntu 15.04 server.

### Run

  - `docker-compose up -d`

### Run manually

- MALV-API

  - Create a config.json file in docker/MALV-API
  - `docker build [--no-cache] -t malvapi ./MALV-API`
  - `docker run --name MALVAPI -d -p 8080:8080 malvapi`

- PizzaDay

  - Create a config.json file in docker/PizzaDay
  - `docker build [--no-cache] -t pizzaday ./PizzaDay`
  - `docker run --name PizzaDay -d -v /opt/mongodb/PizzaDay/db:/data/db -p 9000:9000 pizzaday`

### Docker commands

- List main images: `docker images`

- List all images: `docker images -a`

- List running containers: `docker ps`

- List all containers: `docker ps -a`

- Remove an image and its containers: `docker rmi -f id/name`

- Access a container bash: `docker exec -i -t id/name bash`

- Leave a container bash: `exit`

- Get logs from a container: `docker logs [-f] id/name`

- List open ports on Ubuntu: `netstat -tulnp`