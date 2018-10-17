FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edtsurf" \ 
    container="edtsurf" \ 
    about.summary="triangulated mesh surfaces for protein structures" \ 
    about.home="http://zhanglab.ccmb.med.umich.edu/EDTSurf/" \ 
    software.version="0.2009-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/edtsurf/copyright" \ 
    extra.binaries="/usr/bin/EDTSurf" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y edtsurf && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
