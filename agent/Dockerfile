# FROM nvidia/cuda:10.1-runtime
# FROM nvidia/opencl:devel-ubuntu18.04

FROM ubuntu:18.04

LABEL com.nvidia.volumes.needed="nvidia_driver"

RUN apt-get update && apt-get install -y --no-install-recommends \
        ocl-icd-libopencl1 \
        clinfo && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/OpenCL/vendors && \
    echo "libnvidia-opencl.so.1" > /etc/OpenCL/vendors/nvidia.icd

RUN echo "/usr/local/nvidia/lib" >> /etc/ld.so.conf.d/nvidia.conf && \
    echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH /usr/local/nvidia/bin:${PATH}
ENV LD_LIBRARY_PATH /usr/local/nvidia/lib:/usr/local/nvidia/lib64:${LD_LIBRARY_PATH}

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility





RUN apt update && \
    apt -y dist-upgrade

RUN apt -y install --no-install-recommends \
                   python3 python3-requests python3-psutil \
                   curl jq pciutils p7zip wget ca-certificates

RUN apt clean

COPY init.sh /init.sh
#ENTRYPOINT ["/init.sh"]
