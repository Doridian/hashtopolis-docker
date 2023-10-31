#!/bin/sh
set -e

buildver() {
    cat Dockerfile.template | sed "s/__CUDA_VERSION__/$1/g" > Dockerfile
    docker build --platform=linux/amd64 -t "ghcr.io/doridian/hashtopolis-docker/agent:cuda-$1" .
    docker push "ghcr.io/doridian/hashtopolis-docker/agent:cuda-$1"
}

buildver 12.2.2
buildver 12.1.1
buildver 12.0.1
