#!/bin/bash

environment=${1}
echo "${environment} $CIRCLE_PROJECT_REPONAME $CIRCLE_SHA1 $CIRCLE_BUILD_NUM" | ssh circleci@vpn.token.io -T
