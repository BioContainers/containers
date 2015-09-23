#################################################################
# Dockerfile
#
# Version:          1
# Software:         BioDocker base Image
# Software Version: 20150814
# Base Image:       scratch
# Build Cmd:        docker build --rm -t biodckr/biodocker .
# Pull Cmd:         docker pull biodckr/biodocker
# Run Cmd:          docker run --rm biodckr/biodocker bash
#################################################################
# Source Image
FROM ubuntu:14.04.3

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################
# apt update
RUN apt-get clean all && apt-get update && apt-get upgrade -y

# apt install
RUN apt-get install -y \
        curl       \
        fuse       \
        git        \
        wget       \
        zip        \
        openjdk-7-jre \
        build-essential \
        python \
	python-dev \
        python-pip && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /data /config

#        subversion \
#        mercurial  \
#        cvs        \

# Add biodocker user with password biodocker
RUN useradd --create-home --shell /bin/bash --user-group --uid 1001 --groups sudo,fuse biodocker && \
    echo `echo "biodocker\nbiodocker\n" | passwd biodocker`

# Change user
USER biodocker

# Create $HOME/bin folder
RUN mkdir /home/biodocker/bin

# Add $HOME/bin to path
ENV PATH=$PATH:/home/biodocker/bin
ENV HOME=/home/biodocker

# Share default volumes
VOLUME ["/data", "/config"]

# Overwrite this with 'CMD []' in a dependent Dockerfile
CMD ["/bin/bash"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
