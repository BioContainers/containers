#################################################################
# Dockerfile
#
# Version:          1
# Software:         Clustal-omega
# Software Version: 1.2.1-1
# Description:      general purpose multiple sequence alignment program for proteins
# Website:          http://www.clustal.org/omega/
# Tags:             Proteomics
# Provides:         Clustal-omega 1.2.1-1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/clustalo 1.2.1-1/.
# Pull Cmd:         docker pull biodckr/clustalo
# Run Cmd:          docker run --rm biodckr/clustalo
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

USER root

# Install Clustalo
RUN apt-get update && \
    apt-get install -y \
      clustalo && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER biodocker

CMD ["clustalo", "--help"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
