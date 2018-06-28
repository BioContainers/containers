FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-genefilter" \ 
    container="bioconductor-genefilter" \ 
    about.summary="methods for filtering genes from microarray experiments" \ 
    about.home="https://bioconductor.org/packages/genefilter/" \ 
    software.version="1.56.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 R. Gentleman, V. Carey, W. Huber, F. Hahne" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-genefilter/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-genefilter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
