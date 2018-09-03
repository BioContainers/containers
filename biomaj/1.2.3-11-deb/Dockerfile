FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj" \ 
    container="biomaj" \ 
    about.summary="biological data-bank updater" \ 
    about.home="http://biomaj.genouest.org" \ 
    software.version="1.2.3-11-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="biomaj" \ 
    about.copyright="2011, GenOuest Platform <support@genouest.org>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/biomaj/copyright" \ 
    extra.binaries="/usr/bin/biomaj" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::java,:commandline, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y biomaj && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
