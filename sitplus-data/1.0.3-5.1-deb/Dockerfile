FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sitplus-data" \ 
    container="sitplus-data" \ 
    about.summary="Data files for Sitplus, a framework for ludic-therapeutic activities" \ 
    about.home="http://sitplus.crea-si.com" \ 
    software.version="1.0.3-5.1-deb" \ 
    version="1" \ 
    about.copyright="2011 Cesar Mauri Loba <cesar@crea-si.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/sitplus-data/copyright" \ 
    about.tags="role::app-data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sitplus-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
