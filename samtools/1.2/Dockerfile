#################################################################
# Dockerfile
#
# Version:          1
# Software:         Samtools
# Software Version: 1.2
# Description:      Tools (written in C using htslib) for manipulating next-generation sequencing data
# Website:          https://github.com/samtools/samtools
# Tags:             Genomics
# Provides:         samtools 1.2
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/samtools 1.2/.
# Pull Cmd:         docker pull biodckrdev/samtools
# Run Cmd:          docker run biodckrdev/samtools samtools
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# Change user to root
USER root

RUN apt-get update && \
  apt-get install -y \
  libncurses5-dev \
  libncursesw5-dev && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV ZIP=samtools-1.2.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/samtools
ENV FOLDER=samtools-1.2
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  make && \
  make install && \
  cd / && \
  rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 01-26-2016
