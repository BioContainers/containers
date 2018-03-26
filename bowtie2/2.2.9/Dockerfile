################## BASE IMAGE ######################

FROM biocontainers/biocontainers:latest

################## METADATA ######################
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bowtie2"
LABEL software.version="2.2.9"
LABEL about.summary="an ultrafast memory-efficient short read aligner"
LABEL about.home="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

################## INSTALLATION ######################

ENV ZIP=bowtie2-2.2.9-linux-x86_64.zip
ENV URL=https://github.com/BenLangmead/bowtie2/releases/download/v2.2.9/
ENV FOLDER=bowtie2-2.2.9
ENV DST=/home/biodocker/bin

RUN wget $URL/$ZIP -O $DST/$ZIP && \
    unzip $DST/$ZIP -d $DST && \
    rm $DST/$ZIP && \
    mv $DST/$FOLDER/* $DST && \
    rmdir $DST/$FOLDER

WORKDIR /data

CMD ["bowtie2"]
