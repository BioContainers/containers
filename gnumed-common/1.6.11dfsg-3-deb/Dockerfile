FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gnumed-common" \ 
    container="gnumed-common" \ 
    about.summary="medical practice management - common files" \ 
    about.home="http://www.gnumed.de" \ 
    software.version="1.6.11dfsg-3-deb" \ 
    version="1" \ 
    about.copyright=" 2000-2005 Horst Herb, a.o." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gnumed-common/copyright" \ 
    about.tags="field::medicine, made-of::TODO, role::app-data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gnumed-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
