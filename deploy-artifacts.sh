#! /bin/bash -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

export DOCKER_IMAGE_TAG=latest

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

./gradlew javaexampleComposePull || echo no image to pull

./gradlew javaexampleComposeBuild

./gradlew javaexampleComposePush