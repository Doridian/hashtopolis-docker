# FROM nvidia/cuda:10.0-cudnn7-runtime
FROM nvidia/opencl:devel-ubuntu16.04

RUN apt update && \
    apt -y dist-upgrade && \
    apt -y install git python3 python3-pip python3-setuptools curl jq pciutils p7zip clinfo ocl-icd-libopencl1 \
                   wget p7zip make build-essential git libcurl4-openssl-dev libssl-dev zlib1g-dev

WORKDIR /opt
RUN git clone https://github.com/s3inlc/hashtopolis-agent-python.git

WORKDIR /opt/hashtopolis-agent-python
RUN pip3 install -r requirements.txt

COPY init.sh /init.sh
#ENTRYPOINT ["/init.sh"]
