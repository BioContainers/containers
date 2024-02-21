FROM python:3.11

LABEL base_image="python:3.11"
LABEL version="1"
LABEL software="cellpose"
LABEL software.version="3.0.1"
LABEL about.summary="A generalist algorithm for cell and nucleus segmentation."
LABEL about.home="https://github.com/MouseLand/cellpose"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/MouseLand/cellpose/blob/main/LICENSE"
LABEL about.documentation="https://cellpose.readthedocs.io/en/latest/"
LABEL extra.identifiers.biotools=cellpose

MAINTAINER Yi Sun <sunyi000@gmail.com>
MAINTAINER Florian Wuennemann <flowuenne@gmail.com>

ARG DEBIAN_FRONTEND="noninteractive"
ARG CELLPOSE_VERSION="3.0.1"

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8 \
    LANGUAGE en_US:en

ENV MPLCONFIGDIR=/tmp/mpl_cache
ENV NUMBA_CACHE_DIR=/tmp/numba_cache
ENV CELLPOSE_LOCAL_MODELS_PATH=/tmp/cellpose_models

RUN apt-get update -qq && \
    apt-get install -y -q --no-install-recommends \
            gcc \
            python3-dev \
            python3-pip \
            python3-wheel \
            libblas-dev \
            liblapack-dev \
            libatlas-base-dev \
            gfortran \
            apt-utils \
            bzip2 \
            ca-certificates \
            curl \
            locales \
            unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

RUN pip install --no-cache-dir  -U pip \
    numpy \
    numba>=0.43.1 \
    wheel \
    scipy \
    PyQt5 \
    PyQt5.sip \
    torch>=1.6 \
    opencv-python-headless \
    pyqtgraph>=0.11.0rc0 \
    natsort \
    scikit-image matplotlib \
    scikit-learn \
    tqdm \
    tifffile \
    fastremap \
    cellpose==$CELLPOSE_VERSION