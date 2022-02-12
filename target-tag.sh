#! /bin/bash -e

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[  $BRANCH == "master" ]] ; then
  TARGET_TAG=BUILD-${CIRCLE_BUILD_NUM?}
elif [[  $BRANCH =~ RELEASE$ ]] ; then
  TARGET_TAG=$BRANCH
elif [[  $BRANCH =~ M[0-9]+$ ]] ; then
  TARGET_TAG=$BRANCH
elif [[  $BRANCH =~ RC[0-9]+$ ]] ; then
  TARGET_TAG=$BRANCH
else
  TARGET_TAG=${BRANCH}-${CIRCLE_BUILD_NUM?}
fi

echo $TARGET_TAG
