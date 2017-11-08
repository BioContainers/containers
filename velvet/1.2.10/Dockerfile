#################################################################
# Dockerfile
#
# Version:          1
# Software:         velvet
# Software Version: 1.2.10
# Description:      Short read de novo assembler using de Bruijn graphs
# Website:          http://www.ebi.ac.uk/~zerbino/velvet/|https://github.com/dzerbino/velvet
# Tags:             Genomics
# Provides:         velvet 1.2.10
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/velvet 1.2.10/.
# Pull Cmd:         docker pull biodckrdev/velvet
# Run Cmd:          docker run --rm -it biodckrdev/velvet <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=velvet_1.2.10.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/velvet/
ENV FOLDER=velvet_1.2.10
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    cp $DST/$FOLDER/velvet* $DST && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["velvetg"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

