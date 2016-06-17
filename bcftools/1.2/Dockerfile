#################################################################
# Dockerfile
#
# Version:          1
# Software:         Bcftools
# Software Version: 1.2
# Description:      Bcftools is a program for variant calling and manipulating VCFs and BCFs
# Website:          https://github.com/bcftools/bcftools
# Tags:             Genomics
# Provides:         Bcftools 1.2
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckr/bcftools 1.2/.
# Pull Cmd:         docker pull biodckr/bcftools
# Run Cmd:          docker run biodckr/bcftools
#################################################################

# Source Image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install bcftools=1.2

# Change workdir to /data/
WORKDIR /data/

# Define default command
CMD ["bcftools"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 06-17-2016
