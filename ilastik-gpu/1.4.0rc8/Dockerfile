FROM continuumio/miniconda3

LABEL base_image="continuumio/miniconda3"
LABEL version="1"
LABEL software="ilastik"
LABEL software.version="1.4.0rc8"
LABEL about.summary="the interactive learning and segmentation toolkit"
LABEL about.home="https://ilastik.org"
LABEL about.license="GPL-2.0-or-later"
LABEL about.license_file="https://github.com/ilastik/ilastik/blob/main/LICENSE"
LABEL about.documentation="https://ilastik.org/documentation/index.html"
LABEL extra.identifiers.biotools=ilastik


MAINTAINER Yi Sun <sunyi000@gmail.com>


ARG DEBIAN_FRONTEND="noninteractive"
ARG ILASTIK_VERSION="1.4.0rc8"

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    LANGUAGE=en_US:en  \
    NUMBA_CACHE_DIR=/tmp/numba_cache \
    CONDA_BIN_PATH="/opt/conda/bin" \
    BIOIMAGEIO_CACHE_PATH="/tmp/pybio_cache" \
    PATH="/opt/conda/envs/ilastik/bin:$PATH"
    


RUN apt-get update -qq && \
    apt-get install -y  \
            locales \
            build-essential \
            libglu1-mesa-dev \
            qtcreator \
            libgl1-mesa-glx \
            nautilus \
            xdg-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 


RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

RUN conda install mamba -n base -c conda-forge

RUN mamba create -n ilastik --override-channels -c pytorch -c ilastik-forge -c conda-forge ilastik-gpu=$ILASTIK_VERSION  -y

#ENTRYPOINT["ilastik"]
