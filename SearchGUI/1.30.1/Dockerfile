#################################################################
# Dockerfile
#
# Version:          1
# Software:         SearchGUI
# Software Version: 1.30.1
# Description:      graphical user interface for proteomics identification search engines
# Website:          https://code.google.com/p/searchgui/
# Tags:             Proteomics
# Provides:         searchgui 1.30.1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/searchgui 1.30.1/.
# Pull Cmd:         docker pull biodckr/searchgui
# Run Cmd:          docker run --rm biodckr/searchgui SearchGUI
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

RUN ZIP=SearchGUI-2.6.0.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/SearchGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/SearchGUI-2.6.0/SearchGUI-2.6.0.jar $@"' > /home/biodocker/bin/SearchGUI && \
    chmod +x /home/biodocker/bin/SearchGUI

ENV PATH /home/biodocker/bin/SAINT:$PATH

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
