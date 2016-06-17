#################################################################
# Dockerfile
#
# Version:          2
# Software:         bwa
# Software Version: 0.7.12
# Description:      Burrow-Wheeler Aligner for pairwise alignment between DNA sequences
# Website:          https://github.com/lh3/bwa|http://bio-bwa.sourceforge.net/
# Tags:             Genomics
# Provides:         bwa 0.7.12
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build biodckr/bwa 0.7.12/.
# Pull Cmd:         docker pull biodckr/bwa
# Run Cmd:          docker run biodckr/bwa
#################################################################

# Source Image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install bwa=0.7.12

# Change workdir to /data/
WORKDIR /data/

# Define default command
CMD ["bwa"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>
# Modified by Felipe da Veiga Leprevost 06-17-2016
