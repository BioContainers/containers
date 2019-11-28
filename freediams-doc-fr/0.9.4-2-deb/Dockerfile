FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freediams-doc-fr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="freediams-doc-fr" \ 
    about.summary="FreeDiams French documentation" \ 
    about.home="http://www.freemedforms.com/" \ 
    software.version="0.9.4-2-deb" \ 
    upstream.version="0.9.4" \ 
    version="1" \ 
    about.copyright="2008-2012 by Eric Maeker, MD" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/freediams-doc-fr/copyright" \ 
    about.tags="culture::french, field::medicine, made-of::html, role::documentation" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y freediams-doc-fr || apt-get install -y freediams-doc-fr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
