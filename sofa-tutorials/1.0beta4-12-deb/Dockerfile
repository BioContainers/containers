FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sofa-tutorials" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sofa-tutorials" \ 
    about.summary="Simulation Open Framework Architecture - tutorials" \ 
    about.home="http://www.sofa-framework.org/" \ 
    software.version="1.0beta4-12-deb" \ 
    version="1" \ 
    about.copyright="2006-2008 MGH, INRIA, USTL, UJF, CNRS" \ 
    about.license="LGPL" \ 
    about.license_file="/usr/share/doc/sofa-tutorials/copyright" \ 
    about.tags="devel::doc, devel::examples, role::documentation" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sofa-tutorials || apt-get install -y sofa-tutorials) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
