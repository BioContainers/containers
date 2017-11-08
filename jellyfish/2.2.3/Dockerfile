#################################################################
# Dockerfile
#
# Version:          1
# Software:         jellyfish
# Software Version: 2.2.3
# Description:      A fast multi-threaded k-mer counter
# Website:          https://github.com/gmarcais/Jellyfish
# Tags:             Genomics
# Provides:         jellyfish 2.2.3
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/jellyfish 2.2.3/.
# Pull Cmd:         docker pull biodckrdev/jellyfish
# Run Cmd:          docker run --rm -it biodckrdev/jellyfish <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

ENV ZIP=jellyfish-2.2.3.tar.gz
ENV URL=https://github.com/gmarcais/Jellyfish/releases/download/v2.2.3
ENV FOLDER=jellyfish-2.2.3
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    ./configure && \
    make && \
    make install && \
    cp /usr/local/lib/libjellyfish-2.0.* /lib/x86_64-linux-gnu/ && \
    cd / && \
    rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["jellyfish"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

