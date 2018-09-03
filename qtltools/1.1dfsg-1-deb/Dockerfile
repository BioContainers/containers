FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qtltools" \ 
    container="qtltools" \ 
    about.summary="Tool set for molecular QTL discovery and analysis" \ 
    about.home="https://qtltools.github.io/qtltools/" \ 
    software.version="1.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2016 Olivier Delaneau, Halit Ongen and Emmanouil T. Dermitzakis" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/qtltools/copyright" \ 
    extra.binaries="/usr/bin/QTLtools" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y qtltools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
