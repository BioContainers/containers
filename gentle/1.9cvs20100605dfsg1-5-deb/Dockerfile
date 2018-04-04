FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gentle" \ 
    container="gentle" \ 
    about.summary="suite to plan genetic cloning" \ 
    about.home="http://gentle.magnusmanske.de" \ 
    software.version="1.9cvs20100605dfsg1-5-deb" \ 
    version="1" \ 
    about.copyright=" 2003-2010 Magnus Manske <magnusmanske+gentle@googlemail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/gentle/copyright" \ 
    extra.binaries="/usr/bin/GENtle" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::graphical, interface::x11, role::program,:wxwidgets" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gentle && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
