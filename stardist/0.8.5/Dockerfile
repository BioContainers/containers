FROM tensorflow/tensorflow:2.11.0-gpu-jupyter

LABEL base_image="tensorflow:2.11.0-gpu-jupyter"
LABEL maintainer="ko.sugawara@ens-lyon.fr"
LABEL software="stardist"
LABEL software.version="0.8.5"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/stardist/stardist/blob/master/LICENSE.txt"

MAINTAINER Florian Wuennemann <flowuenne@gmail.com>

ARG DEBIAN_FRONTEND="noninteractive"
ARG STARDIST_VERSION="0.8.5"
ARG NVIDIA_DRIVER_VERSION=470

RUN apt-get update && apt-get install -y --no-install-recommends \
    ocl-icd-dev \
    ocl-icd-opencl-dev \
    opencl-headers \
    clinfo \
    libnvidia-compute-${NVIDIA_DRIVER_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install --upgrade pip
RUN pip install stardist==$STARDIST_VERSION gputools edt