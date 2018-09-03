FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="genometools" \ 
    container="genometools" \ 
    about.summary="versatile genome analysis toolkit" \ 
    about.home="http://genometools.org" \ 
    software.version="1.5.9ds-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="genometools" \ 
    about.license_file="/usr/share/doc/genometools/copyright" \ 
    extra.binaries="/usr/bin/gt" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:lua, interface::commandline, role::program,:ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y genometools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
