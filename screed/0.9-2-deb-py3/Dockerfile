FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="screed" \ 
    container="screed" \ 
    about.summary="short nucleotide read sequence utils in Python 3" \ 
    about.home="https://screed.readthedocs.org" \ 
    software.version="0.9-2-deb-py3" \ 
    version="1" \ 
    about.copyright="2008-2014 Michigan State University" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/screed/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-screed && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
