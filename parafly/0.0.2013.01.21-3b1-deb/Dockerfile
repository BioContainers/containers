FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="parafly" \ 
    container="parafly" \ 
    about.summary="parallel command processing using OpenMP" \ 
    about.home="http://parafly.sourceforge.net" \ 
    software.version="0.0.2013.01.21-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/parafly/copyright" \ 
    extra.binaries="/usr/bin/ParaFly" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y parafly && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
