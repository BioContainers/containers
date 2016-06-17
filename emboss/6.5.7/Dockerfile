#################################################################
# Dockerfile
#
# Version:          1
# Software:         emboss
# Software Version: 6.5.7
# Description:      software analysis package specially developed for
#                   the needs of the molecular biology (e.g. EMBnet) user community
# Website:          http://emboss.sourceforge.net/what/
# Tags:             Proteomics|Genomics|General
# Provides:         emboss 6.5.7
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build biodckr/emboss 6.5.7/.
# Pull Cmd:         docker pull biodckr/emboss
# Run Cmd:          docker run biodckr/emboss
#################################################################

# source image
FROM biodckr/biodocker

################## BEGIN INSTALLATION ###########################

# install
RUN conda install emboss=6.5.7

# set work directory
WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
