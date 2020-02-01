# FROM nvidia/cuda:10.1-runtime
FROM nvidia/opencl:devel-ubuntu18.04

RUN apt update && \
    apt -y dist-upgrade

RUN apt -y install --no-install-recommends \
                   python3 python3-requests python3-psutil \
                   curl jq pciutils p7zip wget ca-certificates

RUN apt clean

COPY init.sh /init.sh
#ENTRYPOINT ["/init.sh"]
