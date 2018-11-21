################## BASE IMAGE ######################
FROM biocontainers/biocontainers:v1.0.0_cv4

################## METADATA ######################
LABEL base_image="biocontainers:v1.0.0_cv4"
LABEL version="2"
LABEL software="FASTX-Toolkit"
LABEL software.version="0.0.14"
LABEL about.summary="a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing"
LABEL about.home="http://hannonlab.cshl.edu/fastx_toolkit/"
LABEL about.documentation="http://hannonlab.cshl.edu/fastx_toolkit/commandline.html"
LABEL about.license_file="http://hannonlab.cshl.edu/fastx_toolkit/license.html"
LABEL about.license="SPDX:AGPL-3.0-only"
LABEL extra.identifiers.biotools="fastx-toolkit"
LABEL about.tags="Genomics"

################## MAINTAINER ######################
MAINTAINER Alicia Mastretta-Yanes <amastretta@conabio.gob.mx>

################## INSTALLATION ######################
USER root

ENV DST=/tmp
ENV URL=https://github.com/agordon/libgtextutils/releases/download/0.7/

RUN wget $URL/libgtextutils-0.7.tar.gz -O $DST/libgtextutils-0.7.tar.gz && \
  tar -xvf $DST/libgtextutils-0.7.tar.gz -C $DST && \
  rm $DST/libgtextutils-0.7.tar.gz && \
  cd $DST/libgtextutils-0.7 && \
  ./configure && \
  make && \
  make install && \
  cd / && \
rm -rf $DST/libgtextutils-0.7

ENV URL=https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/

RUN wget $URL/fastx_toolkit-0.0.14.tar.bz2 -O $DST/fastx_toolkit-0.0.14.tar.bz2 && \
  tar -xvf $DST/fastx_toolkit-0.0.14.tar.bz2 -C $DST && \
  rm $DST/fastx_toolkit-0.0.14.tar.bz2 && \
  cd $DST/fastx_toolkit-0.0.14 && \
  ./configure && \
  make && \
  make install && \
  cd / && \
  rm -rf $DST/fastx_toolkit-0.0.14

RUN ldconfig 

ENV PATH /usr/local/bin:$PATH

USER biodocker

WORKDIR /data/
