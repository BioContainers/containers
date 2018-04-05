FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hhsuite-data" \ 
    container="hhsuite-data" \ 
    about.summary="sensitive protein sequence searching based on HMM-HMM alignment (data)" \ 
    about.home="http://toolkit.genzentrum.lmu.de/sections/search" \ 
    software.version="3.0beta2dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2006, 2012 Johannes Soeding" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/hhsuite-data/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hhsuite-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
