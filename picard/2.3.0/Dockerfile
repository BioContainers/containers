#################################################################
# Dockerfile
#
# Version:          1
# Software:         picard
# Software Version: 2.3.0
# Description:      A set of Java command line tools for manipulating high-throughput sequencing (HTS) data and formats.
# Website:          https://github.com/picard/picard
# Tags:             Genomics
# Provides:         picard 2.3.0
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/picard 2.3.0/.
# Pull Cmd:         docker pull biodckrdev/picard
# Run Cmd:          docker run biodckrdev/picard <program>
#################################################################

# Source Image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install picard=2.3.0

# Change workdir to /data/
WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
