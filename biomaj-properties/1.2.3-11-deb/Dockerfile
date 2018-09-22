FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biomaj-properties" \ 
    container="biomaj-properties" \ 
    about.summary="biological data-bank updater - example properties files" \ 
    about.home="http://biomaj.genouest.org" \ 
    software.version="1.2.3-11-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="biomaj" \ 
    about.copyright="2011, GenOuest Platform <support@genouest.org>" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/biomaj-properties/copyright" \ 
    about.tags="field::biology, role::examples" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y biomaj-properties && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
