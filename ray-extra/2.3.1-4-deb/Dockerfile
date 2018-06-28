FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ray-extra" \ 
    container="ray-extra" \ 
    about.summary="Scripts and XSL sheets for post-processing for ray" \ 
    about.home="http://denovoassembler.sourceforge.net/" \ 
    software.version="2.3.1-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="ray" \ 
    about.copyright="2009-2014 Sbastien Boisvert" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/ray-extra/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ray-extra && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
