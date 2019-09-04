################## BASE IMAGE ######################

FROM biocontainers/biocontainers:v1.1.0_cv2

################## METADATA ######################

LABEL base_image="biocontainers:v1.1.0_cv2"
LABEL version="1"
LABEL software="bowtie2"
LABEL software.version="2.3.1"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license_file="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.license="SPDX:Artistic-2.0"
LABEL extra.identifiers.biotools="bowtie2"
LABEL about.tags="Genomics"
LABEL extra.binaries="bowtie2"

################## MAINTAINER ######################
MAINTAINER Tomoyamac <51290724+tomoyamac@users.noreply.github.com>

################## INSTALLATION ######################

ENV ZIP=bowtie2-2.3.1-legacy-linux-x86_64.zip
ENV URL=https://sourceforge.net/projects/bowtie-bio/files/bowtie2/2.3.1/
ENV FOLDER=bowtie2-2.3.1-legacy
ENV DST=/home/biodocker/bin
ENV ULOCAL=/usr/local/bin

RUN wget $URL/$ZIP/download -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

USER root
RUN ln -s $DST/* $ULOCAL/

WORKDIR /data

CMD ["bowtie2"]
