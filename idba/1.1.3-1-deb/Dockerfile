FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="idba" \ 
    container="idba" \ 
    about.summary="iterative De Bruijn Graph De Novo short read assembler for transcriptome" \ 
    about.home="https://github.com/loneknightpy/idba" \ 
    software.version="1.1.3-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="idba" \ 
    about.copyright="2009-2013 Yu Peng <ypeng@cs.hku.hk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/idba/copyright" \ 
    extra.binaries="/usr/bin/idba,/usr/bin/idba_hybrid" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y idba && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
