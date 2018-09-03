FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cain" \ 
    container="cain" \ 
    about.summary="simulations of chemical reactions" \ 
    about.home="http://cain.sourceforge.net" \ 
    software.version="1.10dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="1999-2012, California Institute of Technology" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/cain/copyright" \ 
    extra.binaries="/usr/bin/cain" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cain && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
