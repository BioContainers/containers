FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fsm-lite" \ 
    container="fsm-lite" \ 
    about.summary="frequency-based string mining (lite)" \ 
    about.home="https://github.com/nvalimak/fsm-lite" \ 
    software.version="1.0-2-deb" \ 
    version="1" \ 
    about.copyright="2015 Niko Vlimki <niko.valimaki@helsinki.fi>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/fsm-lite/copyright" \ 
    extra.binaries="/usr/bin/fsm-lite" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fsm-lite && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
