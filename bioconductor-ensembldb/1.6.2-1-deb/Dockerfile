FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-ensembldb" \ 
    container="bioconductor-ensembldb" \ 
    about.summary="GNU R utilities to create and use an Ensembl based annotation database" \ 
    about.home="https://bioconductor.org/packages/ensembldb/" \ 
    software.version="1.6.2-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2016 Johannes Rainer <johannes.rainer@eurac.edu>," \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/bioconductor-ensembldb/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-ensembldb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
