FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ismrmrd-schema" \ 
    container="ismrmrd-schema" \ 
    about.summary="schema for ISMRMRD" \ 
    about.home="http://ismrmrd.github.io/" \ 
    software.version="1.3.3-1-deb" \ 
    version="1" \ 
    about.copyright="2013-2014 Michael S. Hansen <michael.hansen@nih.gov>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/ismrmrd-schema/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ismrmrd-schema && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
