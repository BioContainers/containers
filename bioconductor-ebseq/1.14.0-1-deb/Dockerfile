FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-ebseq" \ 
    container="bioconductor-ebseq" \ 
    about.summary="R package for RNA-Seq Differential Expression Analysis" \ 
    about.home="https://bioconductor.org/packages/EBSeq/" \ 
    software.version="1.14.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2013-2016 Ning Leng <nleng@wisc.edu>" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-ebseq/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-ebseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
