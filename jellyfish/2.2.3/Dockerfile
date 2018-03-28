############################# Dockerfile ####################################

FROM biocontainers/biocontainers:latest

############################# METADATA ######################################

LABEL base.image="biocontainers:latest"Version:          1
LABEL software="jellyfish"
LABEL software.version="2.2.3"
LABEL about.summary="A fast multi-threaded k-mer counter"
LABEL about.home="https://github.com/gmarcais/Jellyfish"
LABEL about.tags="Genomics"
LABEL about.license_file="https://github.com/gmarcais/Jellyfish/blob/master/LICENSE"
LABEL about.license="SPDX:LGPL-3.0-only"
LABEL about.provides="jellyfish 2.2.3"
LABEL extra.identifiers.biotools="jellyfish"

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

