FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="porechop" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="porechop" \ 
    about.summary="adapter trimmer for Oxford Nanopore reads" \ 
    about.home="https://rrwick.github.io/Porechop" \ 
    software.version="0.2.4dfsg-1-deb" \ 
    upstream.version="0.2.4" \ 
    version="1" \ 
    about.copyright="2017-2018, Ryan Wick" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/porechop/copyright" \ 
    extra.binaries="/usr/bin/porechop" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y porechop || apt-get install -y porechop) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
