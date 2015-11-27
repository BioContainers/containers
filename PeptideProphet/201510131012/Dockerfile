#################################################################
# Dockerfile
#
# Version:          1
# Software:         PeptideProphet
# Software Version: 201510131012
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build -t biodckr/PeptideProphet 201510131012/.
# Pull Cmd:         docker pull biodckr/PeptideProphet
# Run Cmd:          docker run biodckr/PeptideProphet PeptideProphet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

USER biodocker

RUN ZIP=PeptideProphetParser.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/PeptideProphet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    chmod -R 755 /home/biodocker/bin/* && \
    rm /tmp/$ZIP

RUN mv /home/biodocker/bin/PeptideProphetParser /home/biodocker/bin/PeptideProphet

ENV PATH /home/biodocker/bin:$PATH

WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 11-27-2015
