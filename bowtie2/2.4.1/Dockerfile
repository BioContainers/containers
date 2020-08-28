################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL version="2"
LABEL software="bowtie2"
LABEL software.version="2.4.1"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license_file="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license="SPDX:Artistic-2.0"
LABEL extra.identifiers.biotools="bowtie2"
LABEL about.tags="Genomics"
LABEL extra.binaries="bowtie2"

################## MAINTAINER ######################
MAINTAINER Alvin Chen <ychen@aperiomics.com>

################## INSTALLATION ######################
ENV ZIP=bowtie2-2.4.1-linux-x86_64.zip
ENV URL=https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.4.1
ENV FOLDER=bowtie2-2.4.1-linux-x86_64
ENV DST=/home/biodocker/bin
ENV ULOCAL=/usr/local/bin

USER 0

RUN wget $URL/$ZIP/download -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

RUN apt update
RUN apt install python3 -y

RUN ln -s $DST/* $ULOCAL/

USER biodocker

WORKDIR /data

# CMD ["bowtie2"]
