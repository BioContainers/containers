#################################################################
# Dockerfile
#
# Version:          1
# Software:         Comet
# Software Version: 2015011
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build -t biodckr/comet 2015011/.
# Pull Cmd:         docker pull biodckr/comet
# Run Cmd:          docker run biodckr/comet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

USER biodocker

RUN ZIP=comet_binaries_2015011.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/Comet/ && \
    chmod -R 755 /home/biodocker/bin/Comet/* && \
    rm /tmp/$ZIP

RUN mv /home/biodocker/bin/Comet/comet.2015011.linux.exe /home/biodocker/bin/Comet/comet

ENV PATH /home/biodocker/bin/Comet:$PATH

WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 11-27-2015
