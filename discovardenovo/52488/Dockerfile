################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="3"
LABEL software="discovardenovo"
LABEL software.version="52488"
LABEL about.summary="Genome variant discovery through assembly"
LABEL about.home="http://www.broadinstitute.org/software/discovar/blog/?page_id=19"
LABEL about.documentation="http://www.broadinstitute.org/software/discovar/blog/?page_id=19"
LABEL about.license_file="ftp://ftp.broadinstitute.org/pub/crd/Discovar/LICENSE"
LABEL extra.identifiers.biotools="discovar_de_novo"
LABEL about.tags="Genomics"
LABEL extra.binaries="discovardenovo"


################## INSTALLATION ######################

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
# CMD ["discovardenovo"]

##################### INSTALLATION END #####################

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

