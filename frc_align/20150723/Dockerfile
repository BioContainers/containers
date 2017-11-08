################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="frc_align"
LABEL software.version="20150723"
LABEL description="Computes FRC from SAM/BAM file and not from afg files"
LABEL website="https://github.com/jts/frc_courve"
LABEL documentation="https://github.com/jts/frc_courve"
LABEL license="https://github.com/jts/frc_courve"
LABEL tags="Genomics"

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
CMD ["FRC"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

