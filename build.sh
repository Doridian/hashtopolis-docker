#!/bin/sh
set -e

buildver() {
    VER="$1"
    TAGVER="$2"
    TRG="$3"
    cat Dockerfile.template | sed "s~__IMAGE_VERSION__~$VER~g" > Dockerfile
    docker build --platform=linux/amd64 --target="$TRG" -t "ghcr.io/doridian/hashtopolis-docker/agent:$TAGVER" .
    docker push "ghcr.io/doridian/hashtopolis-docker/agent:$TAGVER"
}

buildcuda() {
    CUDAVER="$1"
    shift 1

    buildver "nvidia/cuda:$CUDAVER-devel-ubuntu22.04" "cuda-$CUDAVER" cuda

    for var in "$@"
    do
        docker tag "ghcr.io/doridian/hashtopolis-docker/agent:cuda-$CUDAVER" "ghcr.io/doridian/hashtopolis-docker/agent:cuda-$var"
        docker push "ghcr.io/doridian/hashtopolis-docker/agent:cuda-$var"
    done
}

buildcuda 12.3.1 12.3 12 latest
buildcuda 12.2.2 12.2
#buildcuda 12.1.1 12.1
#buildcuda 12.0.1 12.0

buildver rocm/dev-ubuntu-22.04 rocm base
