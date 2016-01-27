#################################################################
# Dockerfile
#
# Version:          1
# Software:         soapdenovo
# Software Version: 240
# Description:      a novel short-read assembly method that can build a de novo draft assembly for the human-sized genomes
# Website:          http://soap.genomics.org.cn/soapdenovo.html
# Tags:             Genomics
# Provides:         soapdenovo 240
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/soapdenovo 240/.
# Pull Cmd:         docker pull biodckrdev/soapdenovo
# Run Cmd:          docker run biodckrdev/soapdenovo SOAPdenovo-63mer
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

ENV ZIP=SOAPdenovo2-bin-LINUX-generic-r240.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/soapdenovo
ENV FOLDER=SOAPdenovo2-bin-LINUX-generic-r240
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  mv $DST/$FOLDER/SOAPdenovo* /home/biodocker/bin && \
  cd / && \
  rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 08-27-2015
