FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="poretools" \ 
    container="poretools" \ 
    about.summary="toolkit for nanopore nucleotide sequencing data" \ 
    about.home="http://poretools.readthedocs.org" \ 
    software.version="0.6.0dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="poretools" \ 
    about.copyright="Aaron Quinlan <arq5x@virginia.edu>" \ 
    about.license="GPL-1+" \ 
    about.license_file="/usr/share/doc/poretools/copyright" \ 
    extra.binaries="/usr/bin/poretools" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y poretools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
