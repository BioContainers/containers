FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-iranges" \ 
    container="bioconductor-iranges" \ 
    about.summary="GNU R low-level containers for storing sets of integer ranges" \ 
    about.home="https://bioconductor.org/packages/IRanges/" \ 
    software.version="2.8.1-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-iranges/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-iranges && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
