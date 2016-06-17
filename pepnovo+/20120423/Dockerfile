#################################################################
# Dockerfile
#
# Version:          2
# Software:         PepNovo+
# Software Version: 20120423
# Description:      de novo sequencing of low precision MS/MS data
# Website:          http://proteomics.ucsd.edu/Software/PepNovo/
# Tags:             Proteomics
# Provides:         PepNov+ 20120423|dos2unix
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/pepnovo 20120423/.
# Pull Cmd:         docker pull biodckr/pepnovo
# Run Cmd:          docker run --rm biodckr/pepnovo PepNovo_bin
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && \
  apt-get install -y \
	dos2unix  && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

RUN ZIP=PepNovo.20120423.zip && \
  wget https://github.com/BioDocker/software-archive/releases/download/PepNovo/$ZIP -O /tmp/$ZIP && \
  unzip /tmp/$ZIP -d /home/biodocker/bin/PepNovo/ && \
  rm /tmp/$ZIP && \
  cd /home/biodocker/bin/PepNovo/src && \
  make && \
  cp PepNovo_bin /home/biodocker/bin/ && \
  dos2unix /home/biodocker/bin/PepNovo/Models/*.* && \
  dos2unix /home/biodocker/bin/PepNovo/Models/*/*.*

ENV PATH /home/biodocker/bin:$PATH

USER biodocker

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 01-26-2016
