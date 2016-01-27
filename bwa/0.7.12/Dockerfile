#################################################################
# Dockerfile
#
# Version:          1
# Software:         bwa
# Software Version: 0.7.12
# Description:      Burrow-Wheeler Aligner for pairwise alignment between DNA sequences
# Website:          https://github.com/lh3/bwa|http://bio-bwa.sourceforge.net/
# Tags:             Genomics
# Provides:         bwa kit 0.7.12
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/bwa 0.7.12/.
# Pull Cmd:         docker pull biodckrdev/bwa
# Run Cmd:          docker run biodckrdev/bwa bwa
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=bwakit-0.7.12_x64-linux.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/bwa
ENV FOLDER=bwa.kit
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP --strip-components=1 -C $DST && \
  rm $DST/$ZIP

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 01-26-2016
