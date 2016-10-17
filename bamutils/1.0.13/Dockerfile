# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="bamutils"
LABEL software.version="1.0.13"
LABEL description="repository that contains several programs that perform operations on SAM/BAM files"
LABEL website="http://genome.sph.umich.edu/wiki/BamUtil"
LABEL documentation="http://genome.sph.umich.edu/wiki/BamUtil:_FAQ"
LABEL license="https://github.com/statgen/bamUtil/tree/master/copyrights"
LABEL tags="Genomics"

# File Author / Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

USER root

ENV ZIP=BamUtilLibStatGen.1.0.13.tgz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/bamutil/
ENV FOLDER=bamUtil_1.0.13
ENV DST=/tmp

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  tar xvf $DST/$ZIP -C $DST && \
  rm $DST/$ZIP && \
  cd $DST/$FOLDER && \
  make all && \
  make install && \
  cd / && \
  rm -rf $DST/$FOLDER

USER biodocker

WORKDIR /data/
