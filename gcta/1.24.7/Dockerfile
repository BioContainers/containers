#################################################################
# Dockerfile
#
# Version:          1
# Software:         gcta
# Software Version: 1.24.7
# Description:      a tool for Genome-wide Complex Trait Analysis
# Website:          http://cnsgenomics.com/software/gcta/index.html
# Tags:             Genomics
# Provides:         gcta 1.24.7
################## BASE IMAGE ###################### :       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/gcta 1.24.7/.
# Pull Cmd:         docker pull biodckrdev/gcta
# Run Cmd:          docker run --rm -it biodckrdev/gcta <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=gcta_1.24.7.zip
ENV URL=https://github.com/BioDocker/software-archive/releases/download/gcta/
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["gcta64"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

