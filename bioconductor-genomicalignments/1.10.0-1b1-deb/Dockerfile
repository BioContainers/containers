FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-genomicalignments" \ 
    container="bioconductor-genomicalignments" \ 
    about.summary="BioConductor representation and manipulation of short genomic alignments" \ 
    about.home="https://bioconductor.org/packages/GenomicAlignments/" \ 
    software.version="1.10.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-genomicalignments/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-genomicalignments && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
