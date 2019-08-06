FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock-getdata" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="autodock-getdata" \ 
    about.summary="instructions for getData to collect compounds" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-6-deb" \ 
    upstream.version="4.2.6" \ 
    version="1" \ 
    about.copyright="1989-2014, All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/autodock-getdata/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y autodock-getdata || apt-get install -y autodock-getdata) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
