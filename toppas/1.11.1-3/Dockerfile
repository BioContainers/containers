#################################################################
# Dockerfile
#
# Version:          2
# Software:         TOPPAS
# Software Version: 1.11.1-3
# Description:      a graphical workflow editor for the analysis of high-throughput proteomics data
# Website:          http://open-ms.sourceforge.net/workflow-integration/toppasworkflows/
# Tags:             Proteomics
# Provides:         openms 1.11.1-3|topp 1.11.1-3
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/toppas 1.11.1-3/.
# Pull Cmd:         docker pull biodckr/toppas
# Run Cmd:          docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix biodckr/toppas TOPPAS
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && \
  apt-get install -y \
  openms=1.11.1-3 \
  topp=1.11.1-3 && \
  apt-get clean && \
  apt-get purge && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 06-02-2016
