FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="autodock-getdata" \ 
    container="autodock-getdata" \ 
    about.summary="instructions for getData to collect compounds" \ 
    about.home="http://autodock.scripps.edu/" \ 
    software.version="4.2.6-3-deb" \ 
    version="1" \ 
    about.copyright="1989-2014, All Rights Reserved." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/autodock-getdata/copyright" \ 
    extra.identifiers.doi="10.1021/ci049714" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y autodock-getdata && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
