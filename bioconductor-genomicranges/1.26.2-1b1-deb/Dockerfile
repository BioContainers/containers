FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-genomicranges" \ 
    container="bioconductor-genomicranges" \ 
    about.summary="BioConductor representation and manipulation of genomic intervals" \ 
    about.home="https://bioconductor.org/packages/GenomicRanges/" \ 
    software.version="1.26.2-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-genomicranges/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-genomicranges && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
