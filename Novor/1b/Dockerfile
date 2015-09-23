#################################################################
# Dockerfile
#
# Version:          1
# Software:         Novor
# Software Version: 1b
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/novor 1b/.
# Pull Cmd:         docker pull biodckr/novor
# Run Cmd:          docker run --rm  biodckr/novor
#################################################################

# Set the base image
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER biodocker

RUN ZIP=novor_academic_latest.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/NovoR/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/novor_v1b/lib/novor.jar $@" > /home/biodocker/bin/novor' && \
    chmod +x /home/biodocker/bin/novor

WORKDIR /data

CMD ["novor"]

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
# Modified by Felipe da Veiga Leprevost 08-27-2015
