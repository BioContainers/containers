################## BASE IMAGE ######################
FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="discovar"
LABEL software.version="52488"
LABEL about.summary="DISCOVAR is a new variant caller"
LABEL about.home="http://www.broadinstitute.org/software/discovar/blog/?page_id=19"
LABEL about.documentation="http://www.broadinstitute.org/software/discovar/blog/?page_id=19"
LABEL about.license_file="http://www.broadinstitute.org/software/discovar/blog/?page_id=19"
LABEL about.tags="Genomics"


################## INSTALLATION ######################

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

