docker build -t ghcr.io/doridian/hashtopolis-docker:cuda .
docker push ghcr.io/doridian/hashtopolis-docker:cuda

docker build -t doridian/hashtopolis-docker-agent:opencl .
docker push doridian/hashtopolis-docker-agent:opencl

docker run --rm -it doridian/hashtopolis-docker-agent:opencl
