#################################################################
# Dockerfile
#
# Version:          1
# Software:         Crux
# Software Version: 2.1
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/crux 2.1/.
# Pull Cmd:         docker pull biodckr/crux
# Run Cmd:          docker run --rm biodckr/crux [./crux ./xlink-assign-ions ./xlink-score-spectrum]
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

RUN ZIP=crux-2.1.Linux.x86_64.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/Crux/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    ln -sv /home/biodocker/bin/*/bin/* /home/biodocker/bin/

WORKDIR /data

CMD ["crux"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
