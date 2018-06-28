FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="minimap" \ 
    container="minimap" \ 
    about.summary="tool for approximate mapping of long biosequences such as DNA reads" \ 
    about.home="https://github.com/lh3/minimap" \ 
    software.version="0.2-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/minimap/copyright" \ 
    extra.binaries="/usr/bin/minimap" \ 
    extra.identifiers.conda="minimap" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:calculating, works-with::biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y minimap && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
