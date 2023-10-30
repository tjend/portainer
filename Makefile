# run commands via docker-compose


### ENV VARS ###

# defaults
# use docker-compose which works with podman
DOCKER_COMPOSE=docker-compose

# user id
UID=$(shell id -u)

# podman socket
PODMAN_SOCKET=/run/user/$(UID)/podman/podman.sock

# podman host
PODMAN_HOST=unix://${PODMAN_SOCKET}


### DEFAULT RULE ###

.DEFAULT_GOAL := help
# list all make targets
help:
	@echo "Use one of these make targets:"
	@make -rpn | sed -n -e '/^$$/ { n ; /^[^ .#][^ ]*:/p ; }' | sed -e 's/:$$//' | egrep --color '^[^ ]*'


### CATCH CTRL-C ###

# allows trapping SIGINT
.ONESHELL:


### COMMANDS ###

# run portainer in docker
portainer-in-docker:
	echo "Access portainer at http://localhost:9000/ (admin/adminadminadmin recommended) - press CTRL-C when done."
	trap 'true' INT # allows ctrl-c to exit gracefully
	${DOCKER_COMPOSE} pull
	${DOCKER_COMPOSE} up
	${DOCKER_COMPOSE} down

# run portainer in podman
portainer-in-podman:
	echo "Access portainer at http://localhost:9000/ (admin/adminadmin recommended) - press CTRL-C when done."
	trap 'true' INT # allows ctrl-c to exit gracefully
	DOCKER_SOCKET=${PODMAN_SOCKET} DOCKER_HOST=${PODMAN_HOST} ${DOCKER_COMPOSE} pull
	DOCKER_SOCKET=${PODMAN_SOCKET} DOCKER_HOST=${PODMAN_HOST} ${DOCKER_COMPOSE} up
	DOCKER_SOCKET=${PODMAN_SOCKET} DOCKER_HOST=${PODMAN_HOST} ${DOCKER_COMPOSE} down
