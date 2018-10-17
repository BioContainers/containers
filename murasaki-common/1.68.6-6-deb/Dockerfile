FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="murasaki-common" \ 
    container="murasaki-common" \ 
    about.summary="homology detection tool across multiple large genomes (common files)" \ 
    about.home="http://murasaki.dna.bio.keio.ac.jp/wiki/" \ 
    software.version="1.68.6-6-deb" \ 
    version="1" \ 
    about.copyright=" 2006-2010 Keio University; Kris Popendorf" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/murasaki-common/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y murasaki-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
