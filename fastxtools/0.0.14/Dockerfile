# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="FASTX-Toolkit"
LABEL software.version="0.0.14"
LABEL description="a collection of command line tools for Short-Reads FASTA/FASTQ files preprocessing"
LABEL website="http://hannonlab.cshl.edu/fastx_toolkit/"
LABEL documentation="http://hannonlab.cshl.edu/fastx_toolkit/commandline.html"
LABEL license="http://hannonlab.cshl.edu/fastx_toolkit/license.html"
LABEL tags="General"

# Maintainer
MAINTAINER Alicia Mastretta-Yanes <amastretta@conabio.gob.mx>

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