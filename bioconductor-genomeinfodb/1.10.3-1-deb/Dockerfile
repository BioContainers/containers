FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-genomeinfodb" \ 
    container="bioconductor-genomeinfodb" \ 
    about.summary="BioConductor utilities for manipulating chromosome identifiers" \ 
    about.home="https://bioconductor.org/packages/GenomeInfoDb/" \ 
    software.version="1.10.3-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Sonali Arora, Martin Morgan, Marc Carlson, H. Pages" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-genomeinfodb/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-genomeinfodb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
