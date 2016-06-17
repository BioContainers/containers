#################################################################
# Dockerfile
#
# Version:          1
# Software:         SearchGUI
# Software Version: 2.8.6
# Description:      graphical user interface for proteomics identification search engines
# Website:          https://code.google.com/p/searchgui/
# Tags:             Proteomics
# Provides:         searchgui 2.8.6
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/searchgui 2.8.6/.
# Pull Cmd:         docker pull biodckr/searchgui
# Run Cmd:          docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix biodckr/searchgui java -jar /home/biodocker/bin/SearchGUI-2.8.6/SearchGUI-2.8.6.jar
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER biodocker

ENV DISPLAY :0

RUN ZIP=SearchGUI-2.8.6.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/SearchGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/SearchGUI-2.8.6/SearchGUI-2.8.6.jar $@"' > /home/biodocker/bin/SearchGUI && \
    chmod +x /home/biodocker/bin/SearchGUI

ENV PATH /home/biodocker/bin/SearchGUI:$PATH

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
