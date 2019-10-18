FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pal2nal" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pal2nal" \ 
    about.summary="converts proteins to genomic DNA alignment" \ 
    about.home="http://www.bork.embl.de/pal2nal" \ 
    software.version="14.1-2-deb" \ 
    upstream.version="14.1" \ 
    version="1" \ 
    extra.identifiers.biotools="pal2nal" \ 
    about.copyright="2004-2011 Mikita Suyama <mikita@bioreg.kyushu-u.ac.jp>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/pal2nal/copyright" \ 
    extra.binaries="/usr/bin/pal2nal.pl" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pal2nal || apt-get install -y pal2nal) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
