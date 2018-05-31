FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biocgenerics" \ 
    container="bioconductor-biocgenerics" \ 
    about.summary="generic functions for Bioconductor" \ 
    about.home="https://bioconductor.org/packages/BiocGenerics/" \ 
    software.version="0.20.0-1-deb" \ 
    version="1" \ 
    about.copyright="2010-2016 The Bioconductor Dev Team" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biocgenerics/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biocgenerics && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
