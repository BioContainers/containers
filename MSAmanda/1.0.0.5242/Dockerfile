#################################################################
# Dockerfile
#
# Version:          1
# Software:         MSAmanda
# Software Version: 1.0.0.5242
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/msamanda 1.0.0.5242/.
# Pull Cmd:         docker pull biodckr/msamanda
# Run Cmd:          docker run --rm biodckr/msamanda
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && apt-get install mono-complete -y

USER biodocker

RUN ZIP=MSAmanda_Standalone_LinuxMac_1.0.0.5243.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/MSAmanda/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin && \
    rm /tmp/$ZIP && \
    chmod 755 /home/biodocker/bin/MSAmanda_Standalone_LinuxMac_1.0.0.5243/MSAmanda.exe && \
    bash -c 'echo -e "#!/bin/bash\nmono /home/biodocker/bin/MSAmanda_Standalone_LinuxMac_1.0.0.5243/MSAmanda.exe $@" > /home/biodocker/bin/MSAmanda' && \
    chmod +x /home/biodocker/bin/MSAmanda

WORKDIR /data

CMD ["MSAmanda"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
