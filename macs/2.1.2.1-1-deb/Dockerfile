FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="macs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="macs" \ 
    about.summary="Model-based Analysis of ChIP-Seq on short reads sequencers" \ 
    about.home="https://github.com/taoliu/MACS/" \ 
    software.version="2.1.2.1-1-deb" \ 
    upstream.version="2.1.2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="macs" \ 
    about.copyright=" 2008-2013 Tao Liu lab at UB and Xiaole Shirley Liu lab at DFCI" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/macs/copyright" \ 
    extra.binaries="/usr/bin/macs2" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y macs || apt-get install -y macs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
