# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bowtie2"
LABEL software.version="2.2.9"
LABEL description="an ultrafast memory-efficient short read aligner"
LABEL website="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL documentation="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL license="http://bowtie-bio.sourceforge.net/bowtie2/index.shtml"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

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
