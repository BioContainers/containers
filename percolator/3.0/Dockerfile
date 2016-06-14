#################################################################
# Dockerfile
#
# Version:          1
# Software:         percolator
# Software Version: 3.0
# Description:      Semi-supervised learning for peptide identification from shotgun proteomics datasets
# Website:          http://percolator.ms/
# Tags:             Proteomics
# Provides:         percolator 3.0
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/percolator 3.0/.
# Pull Cmd:         docker pull biodckr/percolator
# Run Cmd:          docker run --rm biodckr/percolator percolator
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN ZIP=ubuntu64_release.tar.gz && \
    wget https://github.com/percolator/percolator/releases/download/rel-3-00/$ZIP -O /tmp/$ZIP && \
    tar xvzf /tmp/$ZIP && \
    chmod -R 755 /tmp/* && \
    dpkg -i percolator-converters-v3-00-linux-amd64.deb && \
    dpkg -i percolator-v3-00-linux-amd64.deb && \
    dpkg -i elude-v3-00-linux-amd64.deb && \
    rm /tmp/$ZIP

USER biodocker

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
