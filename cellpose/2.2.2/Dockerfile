FROM python:3.8

LABEL base_image="python:3.8"
LABEL version="2"
LABEL software="cellpose"
LABEL software.version="2.2.2"
LABEL about.summary="A generalist algorithm for cell and nucleus segmentation."
LABEL about.home="https://github.com/MouseLand/cellpose"
LABEL about.license="BSD-3-Clause"
LABEL about.license_file="https://github.com/MouseLand/cellpose/blob/main/LICENSE"
LABEL about.documentation="https://cellpose.readthedocs.io/en/latest/"
LABEL extra.identifiers.biotools=cellpose


MAINTAINER Yi Sun <sunyi000@gmail.com>


ARG DEBIAN_FRONTEND="noninteractive"
ARG CELLPOSE_VERSION="2.2.2"

ENV LANG en_US.UTF-8 \
    LC_ALL en_US.UTF-8 \
    LANGUAGE en_US:en  \
    NUMBA_CACHE_DIR=/tmp

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

RUN pip install -U pip
RUN pip install numpy numba>=0.43.1
RUN pip install wheel scipy
RUN pip install --no-cache-dir PyQt5 PyQt5.sip torch>=1.6 opencv-python-headless pyqtgraph>=0.11.0rc0 natsort

RUN pip install -U scikit-image matplotlib
RUN pip install scikit-learn tqdm tifffile fastremap 
RUN pip install cellpose==$CELLPOSE_VERSION
