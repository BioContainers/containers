ARG DASK_VERSION=2023.8.1

FROM oraclelinux:9

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
