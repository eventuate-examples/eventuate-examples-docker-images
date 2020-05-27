#! /bin/bash -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

VERSION=$BRANCH

DOCKER_REPO=eventuateio
DOCKER_COMPOSE_PREFIX=eventuateexamples_
DOCKER_REMOTE_PREFIX=eventuate-

function tagAndPush() {
  LOCAL=$1
  REMOTE=$2
  FULL_REMOTE=${DOCKER_REMOTE_PREFIX}${REMOTE}
  $PREFIX docker tag ${DOCKER_COMPOSE_PREFIX?}$LOCAL $DOCKER_REPO/${FULL_REMOTE}:$VERSION
  $PREFIX docker tag ${DOCKER_COMPOSE_PREFIX?}$LOCAL $DOCKER_REPO/${FULL_REMOTE}:latest
  echo Pushing $DOCKER_REPO/${FULL_REMOTE}:$VERSION
  $PREFIX docker push $DOCKER_REPO/${FULL_REMOTE}:$VERSION
  $PREFIX docker push $DOCKER_REPO/${FULL_REMOTE}:latest
}

$PREFIX docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker images

tagAndPush "javaexamplebaseimage" "java-example-base-image"