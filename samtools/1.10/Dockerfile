  
################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################

ARG software_version=1.7.0
LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL software="samtools"
LABEL version="1.10"
LABEL software.version="$software_version"
LABEL about.summary="Tools for manipulating next-generation sequencing data"
LABEL about.home="https://github.com/samtools/samtools"
LABEL about.documentation="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools"
LABEL about.license_file="https://github.com/samtools/samtools/blob/develop/LICENSE"
LABEL about.license="SPDX:MIT"
LABEL about.tags="Genomics"
LABEL extra.identifiers.biotools="SAM"
LABEL extra.binaries="samtools"

################## MAINTAINER ######################
MAINTAINER Alvin Chen <ychen@aperiomics.com>

ENV ZIP=samtools-1.10.tar.bz2
ENV URL=https://sourceforge.net/projects/samtools/files/samtools/1.10
ENV FOLDER=samtools-1.10
ENV DST=/home/biodocker/bin
ENV ULOCAL=/usr/local/bin

USER 0

RUN apt-get update
RUN apt-get install -y libz-dev libncurses5-dev libncursesw5-dev libbz2-dev liblzma-dev libcurl4-openssl-dev
RUN wget $URL/$ZIP/download -O $DST/$ZIP && \
    cd $DST && \ 
    tar -jvxf $ZIP && \
    rm $ZIP && \
    cd $FOLDER/ && \
    make && \
    cd /data/ && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

RUN ln -s $DST/* $ULOCAL/

USER biodocker

WORKDIR /data/

# CMD ["samtools"]