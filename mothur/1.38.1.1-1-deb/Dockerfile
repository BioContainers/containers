FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mothur" \ 
    container="mothur" \ 
    about.summary="sequence analysis suite for research on microbiota" \ 
    about.home="http://www.mothur.org" \ 
    software.version="1.38.1.1-1-deb" \ 
    version="1" \ 
    about.copyright=" 2009-2012 Schloss Lab UMASS Amhers., Patrick Schloss <pschloss@umich.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/mothur/copyright" \ 
    extra.binaries="/usr/bin/mothur,/usr/bin/uchime" \ 
    extra.identifiers.conda="mothur" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mothur && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
