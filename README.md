# docker

This repository contains docker configuration files which allows to run my applications on my VPS.

### Run

  - `docker-compose up -d`

### Build

 - `docker-compose build --force-rm --no-cache service`

### Docker commands

- List main images: `docker images`

- List all images: `docker images -a`

- Stop/remove all containers/images: `docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi -f $(docker images -q)`

- Remove an image: `docker rmi -f id/name`

- Remove all images: `docker rmi -f $(docker images -q)`

- List running containers: `docker ps`

- List all containers: `docker ps -a`

- Stop all containers: `docker stop $(docker ps -a -q)`

- Remove a container: `docker rm id/name`

- Remove all containers: `docker rm $(docker ps -a -q)`

- Access a container bash: `docker exec -i -t id/name bash`

- Leave a container bash: `exit`

- Get logs from a container: `docker logs [-f] id/name`

- List open ports on Ubuntu: `netstat -tulnp`
