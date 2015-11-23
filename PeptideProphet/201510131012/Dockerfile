#################################################################
# Dockerfile
#
# Version:          1
# Software:         PeptideProphet
# Software Version: 201510131012
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build -t biodckr/PeptideProphet 201510131012/.
# Pull Cmd:         docker pull biodckr/PeptideProphet
# Run Cmd:          docker run biodckr/PeptideProphet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

USER root

RUN ZIP=PeptideProphetParser.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/PeptideProphet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/PeptideProphet/ && \
    chmod -R 755 /home/biodocker/bin/PeptideProphet/* && \
    rm /tmp/$ZIP

RUN mv /home/biodocker/bin/PeptideProphet/PeptideProphetParser /home/biodocker/bin/PeptideProphet/PeptideProphet

ENV PATH /home/biodocker/bin/PeptideProphet:$PATH

USER biodocker

WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
