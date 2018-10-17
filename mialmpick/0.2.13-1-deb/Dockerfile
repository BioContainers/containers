FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mialmpick" \ 
    container="mialmpick" \ 
    about.summary="Tools for landmark picking in 3D volume data sets" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="0.2.13-1-deb" \ 
    version="1" \ 
    about.copyright="2004-2012 Gert Wollny <gw.fossdev@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/mialmpick/copyright" \ 
    extra.binaries="/usr/bin/mia-lmpick" \ 
    about.tags="uitoolkit::gtk" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mialmpick && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
