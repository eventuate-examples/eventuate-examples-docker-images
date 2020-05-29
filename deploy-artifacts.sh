#!/bin/bash -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [  $BRANCH == "master" ] ; then
  export DOCKER_IMAGE_TAG=BUILD-${CIRCLE_BUILD_NUM?}
elif [[  $BRANCH =~ RELEASE$ ]] ; then
  export DOCKER_IMAGE_TAG=$BRANCH
else
  echo cannot figure out version for this branch $BRANCH
  exit -1
fi

docker-compose build

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker-compose push
