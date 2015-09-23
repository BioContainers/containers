#################################################################
# Dockerfile
#
# Version:          1
# Software:         OpenMS
# Software Version: 1.11.1-3
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/openms 1.11.1-3/.
# Pull Cmd:         docker pull biodckr/openms
# Run Cmd:          docker run --rm biodckr/openms
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && apt-get install -y \
      openms=1.11.1-3 \
      topp=1.11.1-3 && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "biodocker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/biodocker

USER biodocker

# some QT-Apps/Gazebo don't not show controls without this
ENV QT_X11_NO_MITSHM 1

WORKDIR /data

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
