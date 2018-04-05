FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freediams" \ 
    container="freediams" \ 
    about.summary="pharmaceutical drug prescription and interaction manager" \ 
    about.home="http://www.freemedforms.com/" \ 
    software.version="0.9.4-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/freediams/copyright" \ 
    extra.binaries="/usr/bin/freediams" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::organizing, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y freediams && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
