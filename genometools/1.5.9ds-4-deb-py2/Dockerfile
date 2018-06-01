FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools" \ 
    container="genometools" \ 
    about.summary="Python bindings for genometools" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.9ds-4-deb-py2" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license_file="/usr/share/doc/genometools/copyright" \ 
    about.tags="devel::lang:python, devel::library, implemented-in::python,:devel-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-genometools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
