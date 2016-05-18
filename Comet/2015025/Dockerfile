#################################################################
# Dockerfile
#
# Version:          1
# Software:         Comet
# Software Version: 2015025
# Description:      basic local alignment search tool
# Website:          http://comet-ms.sourceforge.net/
# Tags:             Proteomics
# Provides:         Comet 2015025
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/comet 2015025/.
# Pull Cmd:         docker pull biodckr/comet
# Run Cmd:          docker run --rm biodckr/comet comet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER biodocker

RUN ZIP=comet_binaries_2015025.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/Comet/ && \
    chmod -R 755 /home/biodocker/bin/Comet/* && \
    rm /tmp/$ZIP

RUN mv /home/biodocker/bin/Comet/comet.2015025.linux.exe /home/biodocker/bin/Comet/comet

ENV PATH /home/biodocker/bin/Comet:$PATH

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
