FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-deseq2" \ 
    container="bioconductor-deseq2" \ 
    about.summary="R package for RNA-Seq Differential Expression Analysis" \ 
    about.home="https://bioconductor.org/packages/DESeq2/" \ 
    software.version="1.14.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2014 Michael Love, Simon Anders, Wolfgang Huber" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/bioconductor-deseq2/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-deseq2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
