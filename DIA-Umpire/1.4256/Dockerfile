#################################################################
# Dockerfile
#
# Version:          1
# Software:         DIA-Umpire
# Software Version: 1.4256
# Base Image:       biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/diaumpire 1.4256/.
# Pull Cmd:         docker pull biodckr/diaumpire
# Run Cmd:          docker run --rm biodckr/diaumpire
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && \
    apt-get install -y \
      gnuplot     && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN ZIP=tpp-4.8.0.zip && \
    mkdir -p /usr/local && \
    wget https://github.com/BioDocker/software-archive/releases/download/TPP/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /usr/local && \
    rm /tmp/$ZIP

USER biodocker

# Installing DIA-Umpire
#ADD DIA-Umpire.tar.gz /
RUN ZIP=DIA-Umpire_v1_4256.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/DIA-Umpire/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/DIA-Umpire/ && \
    chmod -R 755 /home/biodocker/bin/DIA-Umpire/ && \
    rm /tmp/$ZIP

RUN ZIP=comet_binaries_2015010.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/comet/ && \
    rm /tmp/$ZIP && \
    chmod 755 /home/biodocker/bin/comet/*.exe && \
    ln -sv /home/biodocker/bin/comet/*.exe /home/biodocker/bin/

RUN ZIP=MSGFPlus_9949.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/MSGFPlus/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/MSGFPlus/ && \
    chmod -R 755 /home/biodocker/bin/MSGFPlus/* && \
    rm /tmp/$ZIP

# Setting the Workspace

WORKDIR /data

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
