FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aghermann" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="aghermann" \ 
    about.summary="Sleep-research experiment manager" \ 
    about.home="http://johnhommer.com/academic/code/aghermann" \ 
    software.version="1.1.2-2-deb" \ 
    upstream.version="1.1.2" \ 
    version="1" \ 
    about.copyright="2008-2016 Andrei Zavada <johnhommer@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/aghermann/copyright" \ 
    extra.binaries="/usr/bin/agh-profile-gen,/usr/bin/aghermann,/usr/bin/edfcat,/usr/bin/edfhed,/usr/bin/edfhed-gtk" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:gtk, use::analysing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y aghermann || apt-get install -y aghermann) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
