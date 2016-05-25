#################################################################
# Dockerfile
#
# Version:          1
# Software:         ProteoWizard
# Software Version: 3_0_9740
# Description:      tools and software libraries that facilitate proteomics data analysis.
# Website:          http://proteowizard.sourceforge.net/
# Tags:             Proteomics
# Provides:         ProteoWizard 3_0_9740
# Base Image:       biodckr/biodocker:latest
# Build Cmd:        docker build --rm -t biodckr/pwiz 3_0_9740/.
# Pull Cmd:         docker pull biodckr/pwiz
# Run Cmd:          docker run --rm biodckr/pwiz
#################################################################

# Set the base image to biodckr/biodocker
FROM biodckr/biodocker:latest

################## BEGIN INSTALLATION ###########################

USER biodocker

RUN ZIP=pwiz-bin-linux-x86_64-gcc48-release-3_0_9740.zip && \
    wget https://github.com/BioDocker/software-archive/releases/download/proteowizard/$ZIP -O /tmp/$ZIP && \
    unzip /tmp/$ZIP -d /home/biodocker/bin/pwiz/ && \
    chmod -R 755 /home/biodocker/bin/pwiz/* && \
    rm /tmp/$ZIP

ENV PATH /home/biodocker/bin/pwiz/pwiz-bin-linux-x86_64-gcc48-release-3_0_9740:$PATH

WORKDIR /data/

##################### INSTALLATION END ##########################

# File Author / Maintainer
MAINTAINER Felipe da Veiga Leprevost <felipe@leprevost.com.br>
