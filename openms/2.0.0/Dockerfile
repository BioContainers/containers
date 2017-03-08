# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="OpenMS"
LABEL software.version="2.0.0"
LABEL description="C++ libraries and tools for MS data analysis"
LABEL website="http://www.openms.de/"
LABEL documentation="http://www.openms.de/"
LABEL license="http://www.openms.de/"
LABEL tags="Proteomics"

# Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>

USER root

# Installing dependencies
RUN apt-get -y update && \
    apt-get install -y \
    cmake \
    g++ \
    autoconf \
    qt4-dev-tools \
    patch \
    libtool \
    make \
    git \
    software-properties-common \
    python-software-properties \
    libboost-all-dev \
    libsvm-dev \
    libglpk-dev \
    libzip-dev \
    zlib1g-dev \
    libxerces-c-dev \
    libbz2-dev && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Get contrib & setting folders
WORKDIR /home/biodocker/

RUN git clone https://github.com/OpenMS/contrib.git && \
    mkdir /home/biodocker/contrib-build/

# Change wordir to start building
WORKDIR /home/biodocker/contrib-build/

RUN cmake -DBUILD_TYPE=SEQAN ../contrib && \
    cmake -DBUILD_TYPE=WILDMAGIC ../contrib && \
    cmake -DBUILD_TYPE=EIGEN ../contrib

WORKDIR /home/biodocker/

RUN git clone https://github.com/OpenMS/OpenMS.git

WORKDIR /home/biodocker/OpenMS/

RUN git checkout tags/Release2.0.0

WORKDIR /home/biodocker/

RUN mkdir openms-build

WORKDIR /home/biodocker/openms-build/

RUN cmake -DCMAKE_PREFIX_PATH="/home/biodocker/contrib-build/;/home/biodocker/contrib/;/usr/;/usr/local" -DBOOST_USE_STATIC=OFF -DHAS_XSERVER=Off ../OpenMS && \
  make
  #  ctest

ENV PATH /home/biodocker/openms-build/bin/:$PATH

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data/
