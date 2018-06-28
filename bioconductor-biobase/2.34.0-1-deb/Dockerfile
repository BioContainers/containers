FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biobase" \ 
    container="bioconductor-biobase" \ 
    about.summary="base functions for Bioconductor" \ 
    about.home="https://bioconductor.org/packages/Biobase/" \ 
    software.version="2.34.0-1-deb" \ 
    version="1" \ 
    about.copyright="none claimed, but an author list is provided in the DESCRIPTION file." \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biobase/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biobase && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
