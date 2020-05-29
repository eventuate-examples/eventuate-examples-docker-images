#!/bin/bash -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

export DOCKER_IMAGE_TAG=latest

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker-compose -f docker-compose-java-example-base-image.yml pull || echo no image to pull

docker-compose -f docker-compose-java-example-base-image.yml build

docker-compose -f docker-compose-java-example-base-image.yml push

