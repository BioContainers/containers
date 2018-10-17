FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bioconductor-makecdfenv" \ 
    container="bioconductor-makecdfenv" \ 
    about.summary="BioConductor CDF Environment Maker" \ 
    about.home="https://bioconductor.org/packages/makecdfenv/" \ 
    software.version="1.50.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2016 Rafael A. Irizarry <rafa@jhu.edu>," \ 
    about.license="Artistic-2.0" \ 
    about.license_file="/usr/share/doc/bioconductor-makecdfenv/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y r-bioc-makecdfenv && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
