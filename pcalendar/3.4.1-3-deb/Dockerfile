FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pcalendar" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pcalendar" \ 
    about.summary="track menstrual cycles and predict fertility periods" \ 
    about.home="http://linuxorg.sourceforge.net/" \ 
    software.version="3.4.1-3-deb" \ 
    upstream.version="3.4.1" \ 
    version="1" \ 
    about.copyright="Copyright (C) 2005-2010,  Mar yan Rachynskyy" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/pcalendar/copyright" \ 
    extra.binaries="/usr/bin/pcalendar" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:timekeeping,:viewing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pcalendar || apt-get install -y pcalendar) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
