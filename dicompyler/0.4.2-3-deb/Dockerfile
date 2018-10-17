FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dicompyler" \ 
    container="dicompyler" \ 
    about.summary="radiation therapy research platform" \ 
    about.home="http://www.dicompyler.com/" \ 
    software.version="0.4.2-3-deb" \ 
    version="1" \ 
    about.copyright=" 2005-2014 Aditya Panchal <apanchal@bastula.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/dicompyler/copyright" \ 
    extra.binaries="/usr/bin/dicompyler" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dicompyler && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
