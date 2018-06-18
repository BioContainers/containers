FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sofa-apps" \ 
    container="sofa-apps" \ 
    about.summary="GUI for the Simulation Open Framework Architecture (SOFA)" \ 
    about.home="http://www.sofa-framework.org/" \ 
    software.version="1.0beta4-11b3-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sofa-apps/copyright" \ 
    extra.binaries="/usr/bin/sofa" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::simulating, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sofa-apps && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
