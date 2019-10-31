#!/bin/sh
docker login -u homicevich -p $DOCKER_PASS
if [ "$TRAVIS_BRANCH" = "master" ]; then
    TAG="latest"
else
    TAG="$TRAVIS_BRANCH"
fi
docker build -f Dockerfile -t homicevich/cicd-buzz:$TAG .
docker push homicevich/cicd-buzz
