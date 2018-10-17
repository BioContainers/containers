FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biopython" \ 
    container="biopython" \ 
    about.summary="Python library for bioinformatics (implemented in Python 2)" \ 
    about.home="http://biopython.org" \ 
    software.version="1.68dfsg-3-deb-py2" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/biopython/copyright" \ 
    about.tags="devel::lang:python, devel::library, field::biology,:biology:bioinformatics, implemented-in::python, role::devel-lib,:shared-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-biopython && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
