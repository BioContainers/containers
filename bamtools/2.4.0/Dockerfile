#################################################################
# Dockerfile
#
# Version:          2
# Software:         bamtools
# Software Version: 2.4.0
# Description:      C++ API & command-line toolkit for working with BAM data
# Website:          https://github.com/pezmaster31/bamtools
# Tags:             Genomics
# Provides:         bamtools 2.4.0
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckrdev/bamtools 2.4.0/.
# Pull Cmd:         docker pull biodckrdev/bamtools
# Run Cmd:          docker run --rm -it biodckrdev/bamtools
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install software
RUN conda install bamtools=2.4.0

# set workdir
WORKDIR /data/

# define default command
CMD ["bamtools"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 06-17-2016
