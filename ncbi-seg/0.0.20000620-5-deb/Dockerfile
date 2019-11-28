FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-seg" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-seg" \ 
    about.summary="tool to mask segments of low compositional complexity in amino acid sequences" \ 
    about.home="ftp://ftp.ncbi.nih.gov/pub/seg/seg/" \ 
    software.version="0.0.20000620-5-deb" \ 
    upstream.version="0.0.20000620" \ 
    version="1" \ 
    about.copyright="public-domain" \ 
    about.license="public-domain" \ 
    about.license_file="/usr/share/doc/ncbi-seg/copyright" \ 
    extra.binaries="/usr/bin/ncbi-seg" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-seg || apt-get install -y ncbi-seg) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
