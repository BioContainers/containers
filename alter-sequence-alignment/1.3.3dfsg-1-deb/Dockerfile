FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="alter-sequence-alignment" \ 
    container="alter-sequence-alignment" \ 
    about.summary="genomic sequences ALignment Transformation EnviRonment" \ 
    about.home="http://sing.ei.uvigo.es/ALTER/" \ 
    software.version="1.3.3dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2009-2014 David Posada <dposada@uvigo.es>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/alter-sequence-alignment/copyright" \ 
    extra.binaries="/usr/bin/alter-sequence-alignment" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y alter-sequence-alignment && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
