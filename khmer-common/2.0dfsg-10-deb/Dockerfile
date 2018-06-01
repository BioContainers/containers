FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="khmer-common" \ 
    container="khmer-common" \ 
    about.summary="common files for the khmer project tools" \ 
    about.home="http://khmer.readthedocs.org" \ 
    software.version="2.0dfsg-10-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="khmer" \ 
    about.copyright="2010-2015, Michigan State University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/khmer-common/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y khmer-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
