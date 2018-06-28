FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="visionegg" \ 
    container="visionegg" \ 
    about.summary="Python library for 2D/3D visual stimulus generation" \ 
    about.home="http://www.visionegg.org" \ 
    software.version="1.2.1-2-deb-py2" \ 
    version="1" \ 
    about.copyright="2001-2003 Andrew Straw" \ 
    about.license="LGPL 2.1" \ 
    about.license_file="/usr/share/doc/visionegg/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-visionegg && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
