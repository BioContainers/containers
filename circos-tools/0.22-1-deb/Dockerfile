FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="circos-tools" \ 
    container="circos-tools" \ 
    about.summary="plotter for visualizing data - helper utilities" \ 
    about.home="http://circos.ca/" \ 
    software.version="0.22-1-deb" \ 
    version="1" \ 
    about.copyright="Copyright 2004-2014 Martin Krzywinski" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/circos-tools/copyright" \ 
    about.tags="field::biology:bioinformatics, implemented-in::perl, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y circos-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
