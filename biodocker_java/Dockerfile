#################################################################
# Dockerfile
#
# Version:          1
# Software:         BioDocker base Image with java pre installed
# Software Version: 20150922
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckr/biodocker_java .
# Pull Cmd:         docker pull biodckr/biodocker_java
# Run Cmd:          docker run --rm biodckr/biodocker_java bash
#################################################################
# Source Image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################
# change user
USER root

# apt update
RUN apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Change user
USER biodocker

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
