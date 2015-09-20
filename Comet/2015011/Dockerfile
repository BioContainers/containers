#################################################################
# Dockerfile
#
# Version:          1
# Software:         Comet
# Software Version: 2015011
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build -t biodckr/comet 2015011/.
# Pull Cmd:         docker pull biodckr/comet
# Run Cmd:          docker run biodckr/comet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

# Set noninterative mode
ENV DEBIAN_FRONTEND noninteractive

################## BEGIN INSTALLATION ######################

RUN wget https://github.com/BioDocker/software-archive/releases/download/Comet/comet_binaries_2015011.zip

RUN unzip comet_binaries_2015011.zip -d /comet_binaries_2015011

RUN chmod +x /comet_binaries_2015011/comet.2015011.linux.exe

WORKDIR /comet_binaries_2015011/

ENTRYPOINT ["./comet.2015011.linux.exe"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
