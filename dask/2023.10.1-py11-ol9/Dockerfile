ARG DASK_VERSION=2023.10.1

FROM oraclelinux:9

LABEL base_image="oraclelinux:9"
LABEL software="Dask"
LABEL software.version="2023.10.1"
LABEL python.version="3.11"
LABEL about.summary="Dask is a flexible library for parallel computing in Python."
LABEL about.home="https://www.dask.org"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/dask/dask/blob/main/LICENSE.txt"
LABEL about.documentation="https://docs.dask.org/en/stable/"
LABEL maintainer="biocontainers biodocker@gmail.com"

ARG TARGETPLATFORM

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all

RUN dnf update -y && \
    dnf install -y \
        tar wget \
        hostname \
        procps-ng \
        net-tools \
        which

# Install miniconda
RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-$(uname -m).sh \
    -O mamba-install.sh && \
    bash mamba-install.sh -b -p /opt/mambaforge

ENV PATH=/opt/mambaforge/bin:${PATH}

COPY conda-env.yml /tmp/

RUN mamba env update -n base -f /tmp/conda-env.yml

RUN rm -rf /opt/mambaforge/pkgs

WORKDIR /opt/scripts/daskscripts

ENV DASK_CONFIG=/opt/scripts/daskscripts/config/dask-config.yml

# Add scripts
COPY --chmod=755 scripts/* /opt/scripts/daskscripts
COPY config /opt/scripts/daskscripts/config
