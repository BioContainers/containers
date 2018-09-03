FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sofa-tutorials" \ 
    container="sofa-tutorials" \ 
    about.summary="Simulation Open Framework Architecture - tutorials" \ 
    about.home="http://www.sofa-framework.org/" \ 
    software.version="1.0beta4-11-deb" \ 
    version="1" \ 
    about.copyright="2006-2008 MGH, INRIA, USTL, UJF, CNRS" \ 
    about.license="LGPL" \ 
    about.license_file="/usr/share/doc/sofa-tutorials/copyright" \ 
    about.tags="devel::doc, devel::examples, role::documentation" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sofa-tutorials && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
