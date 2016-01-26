#################################################################
# Dockerfile
#
# Version:          1
# Software:         TPP
# Software Version: 4.8
# Description:      a collection of integrated tools for MS/MS proteomics
# Website:          http://tools.proteomecenter.org/wiki/index.php?title=Software:TPP
# Tags:             Proteomics
# Provides:         tpp 4.8.0
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/tpp 4.8/.
# Pull Cmd:         docker pull biodckr/tpp
# Run Cmd:          docker run --rm biodckr/tpp
# Extra:            This container only posses the binary files, the web interface is not configurated
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

# Change user to root
USER root

################## BEGIN INSTALLATION ######################

WORKDIR /usr/local/

RUN wget https://github.com/BioDocker/software-archive/releases/download/TPP/tpp-4.8.0.zip && \
    unzip tpp-4.8.0.zip

ENV PATH /usr/local/tpp/bin/:$PATH

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 01-26-2016
