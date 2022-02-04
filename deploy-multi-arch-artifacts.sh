#! /bin/bash -e


TARGET_TAG=$(./target-tag.sh)

docker login -u ${DOCKER_USER_ID?} -p ${DOCKER_PASSWORD?}

docker buildx build \
 --platform linux/amd64,linux/arm64 \
 -t eventuateio/eventuate-examples-docker-images-spring-example-base-image:${TARGET_TAG} \
 --push \
 spring-example-base-image
