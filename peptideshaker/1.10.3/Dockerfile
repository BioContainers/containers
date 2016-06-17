#################################################################
# Dockerfile
#
# Version:          1
# Software:         PeptideShaker
# Software Version: 1.10.3
# Description:      terpretation of proteomics identification results
# Website:          http://compomics.github.io/projects/peptide-shaker.html
# Tags:             Proteomics
# Provides:         peptideshaker 1.10.3
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/peptideshaker 1.10.3/.
# Pull Cmd:         docker pull biodckr/peptideshaker
# Run Cmd:          docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix biodckr/peptideshaker java -jar /home/biodocker/bin/PeptideShaker-1.10.3/PeptideShaker-1.10.3.jar
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

RUN ZIP=PeptideShaker-1.10.3.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/PeptideShaker/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/ && \
    rm /tmp/$ZIP && \
    bash -c 'echo -e "#!/bin/bash\njava -jar /home/biodocker/bin/PeptideShaker-1.10.3/PeptideShaker-1.10.3.jar $@"' > /home/biodocker/bin/PeptideShaker && \
    chmod +x /home/biodocker/bin/PeptideShaker

ENV PATH /home/biodocker/bin/PeptideShaker:$PATH

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
