FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="stacks-web" \ 
    container="stacks-web" \ 
    about.summary="web interface for displaying loci from short-read sequences" \ 
    about.home="http://creskolab.uoregon.edu/stacks/" \ 
    software.version="1.44-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="stacks" \ 
    about.copyright=" Julian Catchen <jcatchen@uoregon.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/stacks-web/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y stacks-web && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
