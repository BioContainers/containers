FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cogent" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cogent" \ 
    about.summary="framework for genomic biology" \ 
    about.home="http://pycogent.org/" \ 
    software.version="1.9-14-deb-py2" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    about.copyright="2007-2012 The Cogent Project" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/cogent/copyright" \ 
    about.tags="biology::peptidic, devel::lang:python, devel::library, field::biology,:biology:bioinformatics, implemented-in::python,:commandline, role::devel-lib, role::program, use::analysing,:comparing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-cogent || apt-get install -y python-cogent) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
