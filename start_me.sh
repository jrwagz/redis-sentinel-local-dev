#!/bin/bash
set -ev

DOCKER_HOST_IP=$(ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
# make sure at the same folder as docker-compose.yml
pushd "$(dirname "${0}")"

sed -i "s/DOCKER_HOST_IP=.*/DOCKER_HOST_IP='${DOCKER_HOST_IP}'/g" .env

# Start the services and wait for it.
docker-compose up -d
docker-compose ps