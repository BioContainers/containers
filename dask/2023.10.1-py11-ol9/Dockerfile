ARG DASK_VERSION=2023.10.1

FROM oraclelinux:9

MAINTAINER biocontainers <biodocker@gmail.com>

LABEL base_image="oraclelinux:9"
LABEL version="1"
LABEL software="Dask"
LABEL software.version="2023.10.1-py11-ol9"
LABEL about.summary="Dask is a flexible library for parallel computing in Python."
LABEL about.home="https://www.dask.org"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/dask/dask/blob/main/LICENSE.txt"
LABEL about.documentation="https://docs.dask.org/en/stable/"
LABEL extra.binaries="/opt/mambaforge/bin"
LABEL extra.scripts="/opt/scripts/daskscripts"
LABEL about.tags="implemented-in::python, interface::daemon, role::devel-lib"
LABEL conda_forge.minforge.version="23.3.1-1"
LABEL python.version="3.11"

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
RUN wget https://github.com/conda-forge/miniforge/releases/download/23.3.1-1/Mambaforge-23.3.1-1-Linux-$(uname -m).sh \
    -O mamba-install.sh && \
    bash mamba-install.sh -b -p /opt/mambaforge

ENV PATH=/opt/mambaforge/bin:${PATH}

COPY conda-env.yml /tmp/

RUN mamba env update -n base -f /tmp/conda-env.yml

RUN rm -rf /opt/mambaforge/pkgs

WORKDIR /opt/scripts/daskscripts

ENV DASK_CONFIG=/opt/scripts/daskscripts/config/dask-config.yml

# Add scripts
COPY scripts/* /opt/scripts/daskscripts/
COPY config /opt/scripts/daskscripts/config

RUN chmod 755 /opt/scripts/daskscripts/*.sh
