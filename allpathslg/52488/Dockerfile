# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="AllPathsLG"
LABEL software.version="52488"
LABEL description="whole‐genome shotgun assembler that can generate high‐quality genome assemblies using short reads"
LABEL website=" http://www.broadinstitute.org/software/allpaths-lg/blog/"
LABEL documentation="http://software.broadinstitute.org/allpaths-lg/blog/?page_id=12"
LABEL license="http://software.broadinstitute.org/allpaths-lg/blog/?page_id=12"
LABEL tags="Genomics"

# Maintainer
MAINTAINER Saulo Alves Aflitos <sauloal@gmail.com>

USER root

ENV ZIP=allpathslg-52488.tar.gz
ENV URL=https://github.com/BioDocker/software-archive/releases/download/allpathslg/
ENV FOLDER=allpathslg-52488
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

USER biodocker


WORKDIR /data/
