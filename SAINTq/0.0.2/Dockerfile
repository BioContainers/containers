#################################################################
# Dockerfile
#
# Version:          1
# Software:         SAINTq
# Software Version: 0.0.2
# Description:      assigning confidence scores to protein-protein interactions based on quantitative proteomics
# Website:          http://saint-apms.sourceforge.net/Main.html
# Tags:             Proteomics
# Provides:         SAINTq 0.0.2
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/saintq 0.0.2/.
# Pull Cmd:         docker pull biodckr/saintq
# Run Cmd:          docker run --rm biodckr/saintq saintq
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

USER biodocker

RUN ZIP=saintq.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/SAINTq/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/SAINT/ && \
    chmod -R 755 /home/biodocker/bin/SAINT/* && \
    rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/SAINT:$PATH

WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 11-27-2015
