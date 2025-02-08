#! /bin/bash -e


TARGET_TAG=$(./target-tag.sh)

docker login -u "${DOCKER_USER_ID?}" -p "${DOCKER_PASSWORD?}"

build_image() {
  framework=${1?}
  docker buildx build \
   --platform linux/amd64,linux/arm64 \
   -t "eventuateio/eventuate-examples-docker-images-${framework}-example-base-image:${TARGET_TAG}" \
   --push \
   "${framework}-example-base-image"
}

build_image spring
build_image micronaut
build_image quarkus
