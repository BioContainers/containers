FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="octave-bart" \ 
    container="octave-bart" \ 
    about.summary="Octave bindings for BART" \ 
    about.home="https://mrirecon.github.io/bart/" \ 
    software.version="0.4.00-1-deb" \ 
    version="1" \ 
    about.copyright="2013-2016 The Regents of the University of California" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/octave-bart/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y octave-bart && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
