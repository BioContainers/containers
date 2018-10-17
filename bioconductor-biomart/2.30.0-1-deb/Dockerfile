FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biomart" \ 
    container="bioconductor-biomart" \ 
    about.summary="GNU R Interface to BioMart databases (Ensembl, COSMIC, Wormbase and Gramene)" \ 
    about.home="https://bioconductor.org/packages/biomaRt/" \ 
    software.version="2.30.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Steffen Durinck <sdurinck@gmail.com>," \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biomart/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biomart && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
