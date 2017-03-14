# Base Image
FROM biocontainers/biocontainers:latest

# Metadata
LABEL base.image="biocontainers:latest"
LABEL version="1"
LABEL software="FASTQC"
LABEL software.version="0.11.15"
LABEL description="A quality control tool for high throughput sequence data."
LABEL website="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/"
LABEL documentation="http://www.bioinformatics.babraham.ac.uk/projects/fastqc/Help/"
LABEL license="https://www.gnu.org/copyleft/gpl.html"
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

# FastXtools
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

# FASTQC
ENV URL=http://www.bioinformatics.babraham.ac.uk/projects/fastqc/
ENV ZIP=fastqc_v0.11.5.zip

RUN wget $URL/$ZIP -O $DST/$ZIP && \
  unzip - $DST/$ZIP -d $DST && \
  rm $DST/$ZIP && \
  cd $DST/FastQC && \
  chmod 755 fastqc && \
  ln -s $DST/FastQC/fastqc /usr/local/bin/fastqc
  
ENV PATH /usr/local/bin:$PATH

USER biodocker

CMD fastqc

WORKDIR /data/
