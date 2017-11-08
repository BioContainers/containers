#################################################################
# Dockerfile
#
# Version:          1
# Software:         spades
# Software Version: 3.6.0
# Description:      Tools (written in C using htslib) for manipulating next-generation sequencing data
# Website:          http://bioinf.spbau.ru/spades
# Tags:             Genomics
# Provides:         spades 3.6.0
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/spades 3.6.0/.
# Pull Cmd:         docker pull biodckrdev/spades
# Run Cmd:          docker run --rm -it biodckrdev/spades <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

ENV ZIP=SPAdes-3.6.0-Linux.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/spades
ENV FOLDER=SPAdes-3.6.0-Linux
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mv $DST/$FOLDER/bin/* /home/biodocker/bin && \
    rm -rf $DST/$FOLDER

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["bwa-spades"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

