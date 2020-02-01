docker build -t doridian/hashtopolis-docker-agent:cuda .
docker push doridian/hashtopolis-docker-agent:cuda

docker build -t doridian/hashtopolis-docker-agent:opencl .
docker push doridian/hashtopolis-docker-agent:opencl

docker run --rm -it doridian/hashtopolis-docker-agent:opencl