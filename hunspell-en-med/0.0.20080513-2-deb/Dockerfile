FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hunspell-en-med" \ 
    container="hunspell-en-med" \ 
    about.summary="English medical dictionary for hunspell" \ 
    about.home="http://www.e-medtools.com/Hunspel_openmedspel.html" \ 
    software.version="0.0.20080513-2-deb" \ 
    version="1" \ 
    about.copyright="2007-2008, R Robinson <test@e-medtools.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/hunspell-en-med/copyright" \ 
    about.tags="field::medicine, made-of::dictionary, use::checking, use::learning" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hunspell-en-med && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
