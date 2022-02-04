#!/bin/bash -e

export DOCKER_IMAGE_TAG=$(./target-tag.sh)

docker-compose build

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker-compose push
