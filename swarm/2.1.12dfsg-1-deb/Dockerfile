FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="swarm" \ 
    container="swarm" \ 
    about.summary="robust and fast clustering method for amplicon-based studies" \ 
    about.home="https://github.com/torognes/swarm" \ 
    software.version="2.1.12dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="(C) 2012-2015 Torbjrn Rognes and Frederic Mahe" \ 
    about.license="Affero-GPL-3" \ 
    about.license_file="/usr/share/doc/swarm/copyright" \ 
    extra.binaries="/usr/bin/swarm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y swarm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
