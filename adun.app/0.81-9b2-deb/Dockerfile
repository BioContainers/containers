FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="adun.app" \ 
    container="adun.app" \ 
    about.summary="Molecular Simulator for GNUstep (GUI)" \ 
    about.home="http://diana.imim.es/Adun" \ 
    software.version="0.81-9b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/adun.app/copyright" \ 
    extra.binaries="/usr/bin/UL" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::objc,:graphical,:x11, role::program,:application, suite::gnustep, uitoolkit::gnustep, use::TODO,:analysing,:organizing,:viewing, works-with::3dmodel,:db, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y adun.app && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
