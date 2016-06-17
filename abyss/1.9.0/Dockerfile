#################################################################
# Dockerfile
#
# Version:          3
# Software:         Abyss
# Software Version: 1.9.0
# Description:      ABySS is a *de novo* sequence assembler
# Website:          http://www.bcgsc.ca/platform/bioinfo/software/abyss/releases/1.9.0
# Tags:             Genomics
# Provides:         Abyss 1.9.0
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build biodckr/abyss 1.9.0/.
# Pull Cmd:         docker pull biodckr/abyss
# Run Cmd:          docker run --rm biodckr/abyss
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

# install software
RUN conda install abyss=1.9.0

# set workdir
WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 06-17-2016
