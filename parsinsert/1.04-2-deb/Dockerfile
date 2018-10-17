FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="parsinsert" \ 
    container="parsinsert" \ 
    about.summary="Parsimonious Insertion of unclassified sequences into phylogenetic trees" \ 
    about.home="http://sourceforge.net/projects/parsinsert/" \ 
    software.version="1.04-2-deb" \ 
    version="1" \ 
    about.copyright=" 2007-2011 David Knox" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/parsinsert/copyright" \ 
    extra.binaries="/usr/bin/parsinsert" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y parsinsert && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
