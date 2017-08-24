#!/bin/bash

echo "Tagging image with git sha and build number..."
login=$(aws ecr get-login --no-include-email --region $AWS_REGION)
$login
docker build . -t $AWS_REGISTRY/$CIRCLE_PROJECT_REPONAME:$CIRCLE_SHA1 -t $AWS_REGISTRY/$CIRCLE_PROJECT_REPONAME:$CIRCLE_BUILD_NUM
docker push ${AWS_REGISTRY}/$CIRCLE_PROJECT_REPONAME:$CIRCLE_SHA1
docker push ${AWS_REGISTRY}/$CIRCLE_PROJECT_REPONAME:$CIRCLE_BUILD_NUM
