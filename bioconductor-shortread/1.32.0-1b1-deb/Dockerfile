FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-shortread" \ 
    container="bioconductor-shortread" \ 
    about.summary="GNU R classes and methods for high-throughput short-read sequencing data" \ 
    about.home="https://bioconductor.org/packages/ShortRead/" \ 
    software.version="1.32.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/bioconductor-shortread/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-shortread && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
