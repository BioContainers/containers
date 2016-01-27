#################################################################
# Dockerfile
#
# Version:          1
# Software:         Abyss
# Software Version: 2015020
# Description:      ABySS is a *de novo* sequence assembler
# Website:          http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.9.0
# Tags:             Genomics
# Provides:         Abyss 1.9.0
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/abyss 1.9.0/.
# Pull Cmd:         docker pull biodckr/abyss
# Run Cmd:          docker run --rm biodckr/abyss
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

# Installing dependencies
RUN apt-get -y update && \
  apt-get install -y \
  libboost-all-dev \
  libsqlite3-dev \
  libsqlite3-dev && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ZIP=sparsehash-2.0.2.tar.gz
ENV URL=https://github.com/sparsehash/sparsehash/archive/
ENV FOLDER=sparsehash-sparsehash-2.0.2
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  ./configure && \
  make && \
  make install && \
  cd / && \
  rm -rf $DST/$FOLDER

RUN ZIP=abyss-1.9.0.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/Abyss/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
  rm /tmp/$ZIP

WORKDIR /home/biodocker/bin/abyss-1.9.0/

RUN ./configure && \
  make && \
	make install

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 01-26-2016
