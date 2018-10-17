FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biocparallel" \ 
    container="bioconductor-biocparallel" \ 
    about.summary="BioConductor facilities for parallel evaluation" \ 
    about.home="https://bioconductor.org/packages/BiocParallel/" \ 
    software.version="1.8.1-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Martin Morgan, Michel Lang, Ryan Thompson" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/bioconductor-biocparallel/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biocparallel && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
