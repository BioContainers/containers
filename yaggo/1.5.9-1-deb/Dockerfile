FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="yaggo" \ 
    container="yaggo" \ 
    about.summary="generate command line parser using getopt_long" \ 
    about.home="https://github.com/gmarcais/yaggo" \ 
    software.version="1.5.9-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2014 Guillaume Marais <gmarcais@umd.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/yaggo/copyright" \ 
    extra.binaries="/usr/bin/yaggo" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y yaggo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
