FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="macs" \ 
    container="macs" \ 
    about.summary="Model-based Analysis of ChIP-Seq on short reads sequencers" \ 
    about.home="http://github.com/taoliu/MACS/" \ 
    software.version="2.1.1.20160309-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="macs" \ 
    about.copyright=" 2008-2013 Tao Liu lab at UB and Xiaole Shirley Liu lab at DFCI" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/macs/copyright" \ 
    extra.binaries="/usr/bin/macs2" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y macs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
