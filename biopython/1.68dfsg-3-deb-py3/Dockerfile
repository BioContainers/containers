FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biopython" \ 
    container="biopython" \ 
    about.summary="Python library for bioinformatics (implemented in Python 3)" \ 
    about.home="http://biopython.org" \ 
    software.version="1.68dfsg-3-deb-py3" \ 
    version="1" \ 
    about.copyright=" 2002-2009 Biopython contributors" \ 
    about.license="other" \ 
    about.license_file="/usr/share/doc/biopython/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-biopython && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
