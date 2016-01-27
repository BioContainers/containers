#################################################################
# Dockerfile
#
# Version:          1
# Software:         Bcftools
# Software Version: 1.2
# Description:      Bcftools is a program for variant calling and manipulating VCFs and BCFs
# Website:          https://github.com/bcftools/bcftools
# Tags:             Genomics
# Provides:         Bcftools 1.2
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/bcftools 1.2/.
# Pull Cmd:         docker pull biodckrdev/bcftools
# Run Cmd:          docker run biodckrdev/bcftools bcftools
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# Change user to root
USER root

ENV ZIP=bcftools-1.2.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/bcftools
ENV FOLDER=bcftools-1.2
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
