#################################################################
# Dockerfile
#
# Version:          1
# Software:         htslib
# Software Version: 1.2.1
# about.summary:      C library for high-throughput sequencing data formats
# about.home:          https://github.com/samtools/htslib
# Provides:         htslib 1.2.1
# about.tags:             Genomics
################## BASE IMAGE ###################### :       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/htslib 1.2.1/.
# Pull Cmd:         docker pull biodckrdev/htslib
# Run Cmd:          docker run --rm -it biodckrdev/htslib <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

ENV ZIP=htslib-1.2.1.tar.bz2
ENV URL=https://github.com/BioDocker/software-archive/releases/download/htslib
ENV FOLDER=htslib-1.2.1
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER

# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["tabix"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

