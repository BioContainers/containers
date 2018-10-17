FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cogent" \ 
    container="cogent" \ 
    about.summary="framework for genomic biology" \ 
    about.home="http://pycogent.org/" \ 
    software.version="1.9-9-deb-py2" \ 
    version="1" \ 
    about.copyright="2007-2012 The Cogent Project" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/cogent/copyright" \ 
    about.tags="biology::peptidic, devel::lang:python, field::biology,:python, role::devel-lib, use::analysing, use::comparing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-cogent && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
