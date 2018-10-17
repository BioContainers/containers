FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="openslide" \ 
    container="openslide" \ 
    about.summary="Python 2 wrapper for reading whole slide image files" \ 
    about.home="http://openslide.org" \ 
    software.version="1.1.1-2-deb-py2" \ 
    version="1" \ 
    about.copyright=" 2010-2014 Carnegie Mellon University" \ 
    about.license="LGPL-2.1" \ 
    about.license_file="/usr/share/doc/openslide/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-openslide && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
