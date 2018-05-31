FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biovizbase" \ 
    container="bioconductor-biovizbase" \ 
    about.summary="GNU R basic graphic utilities for visualization of genomic data" \ 
    about.home="https://bioconductor.org/packages/biovizBase/" \ 
    software.version="1.22.0-2-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Tengfei Yin, Michael Lawrence, Dianne Cook" \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-biovizbase/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biovizbase && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
