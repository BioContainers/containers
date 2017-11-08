#################################################################
# Dockerfile
#
# Version:          1
# Software:         discovardenovo
# Software Version: 52488
# Description:      Genome variant discovery through assembly
# Website:          http://www.broadinstitute.org/software/discovar/blog/?page_id=19
# Tags:             Genomics
# Provides:         discovardenovo 52488
################## BASE IMAGE ###################### :       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/discovardenovo 52488/.
# Pull Cmd:         docker pull biodckrdev/discovardenovo
# Run Cmd:          docker run --rm -it biodckrdev/discovardenovo <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root


ENV ZIP=jemalloc-4.0.2.tar.bz2
ENV URL=https://github.com/jemalloc/jemalloc/releases/download/4.0.2/
ENV FOLDER=jemalloc-4.0.2
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    ./configure && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER



ENV ZIP=discovardenovo-52488.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/discovardenovo
ENV FOLDER=discovardenovo-52488
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
CMD ["discovardenovo"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

