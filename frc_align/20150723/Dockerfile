################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="frc_align"
LABEL software.version="20150723"
LABEL about.summary="Computes FRC from SAM/BAM file and not from afg files"
LABEL about.home="https://github.com/vezzi/FRC_align"
LABEL about.documentation="https://github.com/vezzi/FRC_align"
LABEL about.license_file="https://github.com/vezzi/FRC_align/blob/master/COPYING"
LABEL about.license="SPDX:GPL-3.0-only"
LABEL about.tags="Genomics"
LABEL extra.binaries="FRC"

################## INSTALLATION ######################

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
# CMD ["FRC"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

