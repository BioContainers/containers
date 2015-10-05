#################################################################
# Dockerfile
#
# Version:          1
# Software:         Comet
# Software Version: 2015020
# Description:      basic local alignment search tool
# Website:          http://comet-ms.sourceforge.net/
# Tags:             Proteomics
# Provides:         Comet 2015020
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/comet 2015020/.
# Pull Cmd:         docker pull biodckr/comet
# Run Cmd:          docker run --rm biodckr/comet
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

RUN ZIP=comet_binaries_2015020.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/Comet/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin && \
    rm /tmp/$ZIP && \
    chmod +x /home/biodocker/bin/comet.2015020.linux.exe && \
    ln -s /home/biodocker/bin/comet.2015020.linux.exe /home/biodocker/bin/comet

WORKDIR /data

CMD ["comet"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
