#################################################################
# Dockerfile
#
# Version:          1
# Software:         bamtools
# Software Version: 2.4.0
# Description:      C++ API & command-line toolkit for working with BAM data
# Website:          https://github.com/pezmaster31/bamtools
# Tags:             Genomics
# Provides:         bamtools 2.4.0
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/bamtools 2.4.0/.
# Pull Cmd:         docker pull biodckrdev/bamtools
# Run Cmd:          docker run --rm -it biodckrdev/bamtools <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

ENV ZIP=v2.4.0.tar.gz
ENV URL=https://github.com/pezmaster31/bamtools/archive/
ENV FOLDER=bamtools-2.4.0
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  mkdir build && \
  cd build && \
  cmake .. && \
  make && \
  make install && \
  cp $DST/$FOLDER/lib/* /lib/ && \
  rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 01-26-2016
