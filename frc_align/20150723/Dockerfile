#################################################################
# Dockerfile
#
# Version:          1
# Software:         frc_align
# Software Version: 20150723
# Description:      Computes FRC from SAM/BAM file and not from afg files
# Website:          https://github.com/jts/frc_courve
# Tags:             Genomics
# Provides:         frc_align 20150723
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/frc_align 20150723/.
# Pull Cmd:         docker pull biodckrdev/frc_align
# Run Cmd:          docker run --rm -it biodckrdev/frc_align <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

RUN apt-get update && \
    apt-get install -y \
      libboost-all-dev \
    && \
    apt-get clean && \
    apt-get purge && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ENV ZIP=5b3f53e01cb539c857fd4230ec9410d76220fe22.zip
ENV URL=https://github.com/vezzi/FRC_align/archive/
ENV FOLDER=FRC_align-5b3f53e01cb539c857fd4230ec9410d76220fe22
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    set -xeu && cd $DST/$FOLDER && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    cp -ar $DST/$FOLDER/lib/* /lib/ && \
    cp $DST/$FOLDER/bin/FRC /usr/bin/ && \
    rm -rf $DST/$FOLDER
   
# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["FRC"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

