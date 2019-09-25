FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="getdata" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="getdata" \ 
    about.summary="management of external databases" \ 
    about.home="http://debian-med.alioth.debian.org" \ 
    software.version="0.2-3-deb" \ 
    upstream.version="0.2" \ 
    version="1" \ 
    about.copyright=" 2008-2010 University of Luebeck, Germany" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/getdata/copyright" \ 
    extra.binaries="/usr/bin/getData" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y getdata || apt-get install -y getdata) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
