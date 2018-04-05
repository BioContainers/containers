FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="disulfinder-data" \ 
    container="disulfinder-data" \ 
    about.summary="data files for predictor of disulfide bonds in proteins" \ 
    about.home="http://disulfind.dsi.unifi.it/" \ 
    software.version="1.2.11-6-deb" \ 
    version="1" \ 
    about.copyright=" 2011 Alessio Ceroni," \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/disulfinder-data/copyright" \ 
    about.tags="role::app-data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y disulfinder-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
