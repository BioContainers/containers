FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freediams" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="freediams" \ 
    about.summary="pharmaceutical drug prescription and interaction manager" \ 
    about.home="http://www.freemedforms.com/" \ 
    software.version="0.9.4-2-deb" \ 
    upstream.version="0.9.4" \ 
    version="1" \ 
    about.copyright="2008-2012 by Eric Maeker, MD" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/freediams/copyright" \ 
    extra.binaries="/usr/bin/freediams" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::organizing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y freediams || apt-get install -y freediams) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
