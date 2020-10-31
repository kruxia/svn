#!/bin/bash

set -eu

TIMESTAMP=$(date -u +%Y%m%d%H%M%S)
SHORT_SHA=$(git rev-parse --short HEAD)

docker build docker --file docker/Dockerfile --tag kruxia/svn:alpine
docker tag kruxia/svn:alpine kruxia/svn:alpine-$SHORT_SHA
docker tag kruxia/svn:alpine kruxia/svn

# docker build docker --file docker/buster-slim.Dockerfile --tag kruxia/svn:buster-slim
# docker tag kruxia/svn:buster-slim kruxia/svn:buster-slim-$SHORT_SHA

while test $# -gt 0
do
    case "$1" in
        --push)
            docker push kruxia/svn:latest
            docker push kruxia/svn:alpine
            docker push kruxia/svn:alpine-$SHORT_SHA
            ;;
    esac
    shift
done
