FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-geneplotter" \ 
    container="bioconductor-geneplotter" \ 
    about.summary="R package of functions for plotting genomic data" \ 
    about.home="https://bioconductor.org/packages/geneplotter/" \ 
    software.version="1.52.0-2-deb" \ 
    version="1" \ 
    about.copyright=" 2001 R. Gentelman and biocore" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-geneplotter/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-geneplotter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
