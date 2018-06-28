FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools-common" \ 
    container="genometools-common" \ 
    about.summary="shared data files for GenomeTools" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.9ds-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license_file="/usr/share/doc/genometools-common/copyright" \ 
    about.tags="role::app-data, uitoolkit::ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y genometools-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
