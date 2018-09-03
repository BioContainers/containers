FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freediams-doc-en" \ 
    container="freediams-doc-en" \ 
    about.summary="FreeDiams English documentation" \ 
    about.home="http://www.freemedforms.com/" \ 
    software.version="0.9.4-1-deb" \ 
    version="1" \ 
    about.copyright="2008-2012 by Eric Maeker, MD" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/freediams-doc-en/copyright" \ 
    about.tags="field::medicine, made-of::html, role::documentation" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y freediams-doc-en && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
