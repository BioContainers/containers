FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-biomformat" \ 
    container="bioconductor-biomformat" \ 
    about.summary="GNU R interface package for the BIOM file format" \ 
    about.home="https://bioconductor.org/packages/biomformat/" \ 
    software.version="1.2.0-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2016 Paul J. McMurdie <mcmurdie@stanford.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/bioconductor-biomformat/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-biomformat && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
