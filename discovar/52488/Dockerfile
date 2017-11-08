#################################################################
# Dockerfile
#
# Version:          1
# Software:         discovar
# Software Version: 52488
# Description:      DISCOVAR is a new variant caller
# Website:          http://www.broadinstitute.org/software/discovar/blog/?page_id=19
# Tags:             Genomics
# Provides:         discovar 52488
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/discovar 52488/.
# Pull Cmd:         docker pull biodckrdev/discovar
# Run Cmd:          docker run --rm -it biodckrdev/discovar <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

ENV ZIP=discovar-52488.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/discovar
ENV FOLDER=discovar-52488
ENV DST=/tmp

ENV MALLOC_PER_THREAD 1

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["Discovar"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

