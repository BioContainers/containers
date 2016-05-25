#################################################################
# Dockerfile
#
# Version:          1
# Software:         denovogui
# Software Version: 1.10.4
# Description:      graphical user interface for de novo sequencing of tandem mass spectra
# Website:          https://code.google.com/p/denovogui/
# Tags:             Proteomics
# Provides:         denovogui 1.10.4
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/denovogui 1.10.4/.
# Pull Cmd:         docker pull biodckr/denovogui
# Run Cmd:          docker run --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix biodckr/denovogui
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ######################

USER root

RUN echo "biodocker ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/biodocker

USER biodocker

RUN ZIP=DeNovoGUI-1.10.4.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/deNovoGUI/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/DeNovoGUI-1.10.4/DeNovoGUI-1.10.4.jar $@" > /home/biodocker/bin/denovogui' && \
    chmod +x /home/biodocker/bin/denovogui

WORKDIR /data

#CMD ["denovogui"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
