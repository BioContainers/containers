FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="staden-common" \ 
    container="staden-common" \ 
    about.summary="Architecture independent files for Staden" \ 
    about.home="https://staden.sf.net" \ 
    software.version="2.0.0b11-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="staden" \ 
    about.copyright="1995-2001 Medical Research Council, Laboratory of Molecular Biology" \ 
    about.license="BSD-like" \ 
    about.license_file="/usr/share/doc/staden-common/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y staden-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
