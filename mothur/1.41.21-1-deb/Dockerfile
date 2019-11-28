FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mothur" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mothur" \ 
    about.summary="sequence analysis suite for research on microbiota" \ 
    about.home="http://www.mothur.org" \ 
    software.version="1.41.21-1-deb" \ 
    upstream.version="1.41.21" \ 
    version="1" \ 
    about.copyright=" 2009-2012 Schloss Lab UMASS Amhers., Patrick Schloss <pschloss@umich.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/mothur/copyright" \ 
    extra.binaries="/usr/bin/mothur,/usr/bin/uchime" \ 
    about.tags="role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mothur || apt-get install -y mothur) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
