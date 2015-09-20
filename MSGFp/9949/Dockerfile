#################################################################
# Dockerfile
#
# Version:          1
# Software:         MSGF+
# Software Version: 9949
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/msgfp 9949/.
# Pull Cmd:         docker pull biodckr/msgfp
# Run Cmd:          docker run --rm biodckr/msgfp
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER root

RUN apt-get update && apt-get install openjdk-7-jre -y

USER biodocker

RUN ZIP=MSGFPlus_9949.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/MSGFPlus/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/MSGFPlus_9949/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/MSGFPlus_9949/MSGFPlus.jar $@" > /home/biodocker/bin/MSGFPlus' && \
    chmod +x /home/biodocker/bin/MSGFPlus

WORKDIR /data

CMD ["MSGFPlus"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
