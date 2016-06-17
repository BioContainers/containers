#################################################################
# Dockerfile
#
# Version:          2
# Software:         emboss
# Software Version: 6.6.0-1
# Description:      software analysis package specially developed for the needs of the molecular biology (e.g. EMBnet) user community
# Website:          http://emboss.sourceforge.net/what/
# Tags:             Proteomics|Genomics|General
# Provides:         emboss 6.6.0-1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/emboss 6.6.0-1/.
# Pull Cmd:         docker pull biodckr/emboss
# Run Cmd:          docker run --rm biodckr/emboss
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

# Install EMBOSS package
RUN apt-get update && \
  apt-get install -y \
  emboss=6.6.0-1 && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 01-26-2016
