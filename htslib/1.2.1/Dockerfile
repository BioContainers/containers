############################### Dockerfile ##################################

FROM biocontainers/biocontainers:latest

################################# METADATA ###################################

LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="htslib"
LABEL software.version="1.2.1"
LABEL about.summary="C library for high-throughput sequencing data formats"
LABEL about.home="https://github.com/samtools/htslib"
LABEL about.provides="htslib 1.2.1"
LABEL about.license_file="https://github.com/samtools/htslib/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"

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

