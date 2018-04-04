FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="chado-utils" \ 
    container="chado-utils" \ 
    about.summary="tools to add/extract data from Chado" \ 
    about.home="http://gmod.org/wiki/Chado" \ 
    software.version="1.31-3-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/chado-utils/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y chado-utils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
