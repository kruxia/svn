#!/bin/bash

set -eu

TIMESTAMP=$(date -u +%Y%m%d%H%M%S)
SHORT_SHA=$(git rev-parse --short HEAD)

docker build docker --file docker/Dockerfile --tag kruxia/svn:alpine
docker tag kruxia/svn:alpine kruxia/svn:alpine-$TIMESTAMP-$SHORT_SHA
docker tag kruxia/svn:alpine kruxia/svn

# docker build docker --file docker/buster-slim.Dockerfile --tag kruxia/svn:buster-slim
# docker tag kruxia/svn:buster-slim kruxia/svn:buster-slim-$TIMESTAMP-$SHORT_SHA

docker push kruxia/svn
docker push kruxia/svn:alpine
docker push kruxia/svn:alpine-$TIMESTAMP-$SHORT_SHA

# docker push kruxia/svn:buster-slim
# kruxia/svn:buster-slim-$TIMESTAMP-$SHORT_SHA
