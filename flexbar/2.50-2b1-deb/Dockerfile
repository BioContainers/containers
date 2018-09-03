FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="flexbar" \ 
    container="flexbar" \ 
    about.summary="flexible barcode and adapter removal for sequencing platforms" \ 
    about.home="https://sourceforge.net/projects/flexbar/" \ 
    software.version="2.50-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/flexbar/copyright" \ 
    extra.binaries="/usr/bin/flexbar" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y flexbar && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
