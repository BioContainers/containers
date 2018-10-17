FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="garli" \ 
    container="garli" \ 
    about.summary="phylogenetic analysis of molecular sequence data using maximum-likelihood" \ 
    about.home="https://github.com/Ashod/garli" \ 
    software.version="2.1-1-deb" \ 
    version="1" \ 
    about.copyright="2006-2014 Ashod Nakashian" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/garli/copyright" \ 
    extra.binaries="/usr/bin/garli" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y garli && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
