FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-preprocesscore" \ 
    container="bioconductor-preprocesscore" \ 
    about.summary="BioConductor collection of pre-processing functions" \ 
    about.home="https://bioconductor.org/packages/preprocessCore/" \ 
    software.version="1.36.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Benjamin Milo Bolstad <bmb@bmbolstad.com>" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/bioconductor-preprocesscore/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-preprocesscore && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
