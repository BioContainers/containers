FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circos" \ 
    container="circos" \ 
    about.summary="plotter for visualizing data" \ 
    about.home="http://circos.ca/" \ 
    software.version="0.69.4dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="circos" \ 
    about.copyright="Copyright 2004-2016 Martin Krzywinski" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/circos/copyright" \ 
    extra.binaries="/usr/bin/circos" \ 
    about.tags="field::biology:bioinformatics, implemented-in::perl, role::program,:viewing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y circos && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
