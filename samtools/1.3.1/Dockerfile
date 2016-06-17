#################################################################
# Dockerfile
#
# Version:          1
# Software:         Samtools
# Software Version: 1.3.1
# Description:      Tools (written in C using htslib) for manipulating next-generation sequencing data
# Website:          https://github.com/samtools/samtools
# Tags:             Genomics
# Provides:         samtools 1.3.1
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckr/samtools 1.3.1/.
# Pull Cmd:         docker pull biodckr/samtools
# Run Cmd:          docker run biodckr/samtools
#################################################################

# base image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install samtools=1.3.1

# change workdir to /data/
WORKDIR /data/

# define default command
CMD ["samtools"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
