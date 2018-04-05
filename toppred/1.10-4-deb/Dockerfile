FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="toppred" \ 
    container="toppred" \ 
    about.summary="transmembrane topology prediction" \ 
    about.home="https://github.com/bioinfo-center-pasteur-fr/toppred" \ 
    software.version="1.10-4-deb" \ 
    version="1" \ 
    about.copyright=" 1999-2001 Eric Deveaud <edeveaud@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/toppred/copyright" \ 
    extra.binaries="/usr/bin/toppred" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y toppred && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
