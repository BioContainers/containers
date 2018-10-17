FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freecontact" \ 
    container="freecontact" \ 
    about.summary="fast protein contact predictor" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.0.21-5-deb" \ 
    version="1" \ 
    about.copyright="2013 Laszlo Kajan <lkajan@rostlab.org>, Technical University of Munich, Germany" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/freecontact/copyright" \ 
    extra.binaries="/usr/bin/freecontact" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y freecontact && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
