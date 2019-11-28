FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sofa-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sofa-data" \ 
    about.summary="Simulation Open Framework Architecture - data" \ 
    about.home="http://www.sofa-framework.org/" \ 
    software.version="1.0beta4-12-deb" \ 
    version="1" \ 
    about.copyright="2006-2008 MGH, INRIA, USTL, UJF, CNRS" \ 
    about.license="LGPL" \ 
    about.license_file="/usr/share/doc/sofa-data/copyright" \ 
    about.tags="role::app-data" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sofa-data || apt-get install -y sofa-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
