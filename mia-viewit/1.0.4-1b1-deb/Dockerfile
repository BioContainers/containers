FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mia-viewit" \ 
    container="mia-viewit" \ 
    about.summary="Viewer program for 3D data sets created by using MIA" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="1.0.4-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/mia-viewit/copyright" \ 
    extra.binaries="/usr/bin/mia-viewitgui" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::gtk, use::viewing,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mia-viewit && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
