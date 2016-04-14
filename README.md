# docker

### MongoDB

- Go to docker/MongoDB
- Run `docker build -t mongodb .`
- Run `docker run --name MongoDB -d -v /opt/mongodb/db:/data/db mongodb`

### PizzaDay

- Go to docker/PizzaDay
- Run `docker build -t pizzaday .`
- Run `docker run --name PizzaDay -d --link MongoDB:MongoDB -p 9000:9000 pizzaday`

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