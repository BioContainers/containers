#################################################################
# Dockerfile
#
# Version:          1
# Software:         sga
# Software Version: 0.10.13
# Description:      de novo sequence assembler using string graphs
# Website:          https://github.com/jts/sga
# Tags:             Genomics
# Provides:         sga 0.10.13|bamtools 2.4.0|sparsehash 2.0.2|jemalloc 4.0.2|pysam 0.8.3|ruffus 2.6.3
# Base Image:       biodckr/biodocker
# Build Cmd:        docker build --rm -t biodckrdev/sga 0.10.13/.
# Pull Cmd:         docker pull biodckrdev/sga
# Run Cmd:          docker run --rm -it biodckrdev/sga <options> <files>
#################################################################

# Set the base image to Ubuntu
FROM biodckr/biodocker

################## BEGIN INSTALLATION ######################

# Change user to root
USER root

ENV ZIP=sparsehash-2.0.2.tar.gz
ENV URL=https://github.com/sparsehash/sparsehash/archive
ENV FOLDER=sparsehash-sparsehash-2.0.2
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




RUN pip install pysam==0.8.3 && \
    pip install ruffus==2.6.3





ENV ZIP=v2.4.0.tar.gz
ENV URL=https://github.com/pezmaster31/bamtools/archive/
ENV FOLDER=bamtools-2.4.0
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cp -ar $DST/$FOLDER/lib/* /lib/ && \
    mkdir -p /var/lib/bamtools/include && \
    cp -ar $DST/$FOLDER/include/* /var/lib/bamtools/include && \
    rm -rf $DST/$FOLDER





ENV ZIP=v0.10.13.tar.gz
ENV URL=https://github.com/jts/sga/archive
ENV FOLDER=sga-0.10.13
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    tar xvf $DST/$ZIP -C $DST && \
    rm $DST/$ZIP && \
    cd $DST/$FOLDER/src && \
    ./autogen.sh && \
    ./configure --with-bamtools=/var/lib/bamtools -with-jemalloc=/usr/local/lib && \
    make && \
    make install && \
    cd / && \
    rm -rf $DST/$FOLDER



# Change user to back to biodocker
USER biodocker

# CHANGE WORKDIR TO /DATA
WORKDIR /data

# DEFINE DEFAULT COMMAND
CMD ["sga"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

