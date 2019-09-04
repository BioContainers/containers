FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="adun.app" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="adun.app" \ 
    about.summary="Molecular Simulator for GNUstep (GUI)" \ 
    about.home="http://wiki.gnustep.org/index.php/Adun" \ 
    software.version="0.81-13-deb" \ 
    upstream.version="0.81" \ 
    version="1" \ 
    about.copyright=" 2003-2007 Alexander V. Diemand (MolTalk)" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/adun.app/copyright" \ 
    extra.binaries="/usr/bin/UL" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::objc,:graphical,:x11, role::program,:application, suite::gnustep, uitoolkit::gnustep, use::TODO,:analysing,:organizing,:viewing, works-with::3dmodel,:db, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y adun.app || apt-get install -y adun.app) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
