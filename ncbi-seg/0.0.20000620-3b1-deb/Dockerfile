FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-seg" \ 
    container="ncbi-seg" \ 
    about.summary="tool to mask segments of low compositional complexity in amino acid sequences" \ 
    about.home="ftp://ftp.ncbi.nih.gov/pub/seg/seg/" \ 
    software.version="0.0.20000620-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ncbi-seg/copyright" \ 
    extra.binaries="/usr/bin/ncbi-seg" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncbi-seg && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
