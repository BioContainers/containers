FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ssw-align" \ 
    container="ssw-align" \ 
    about.summary="Smith-Waterman aligner based on libssw" \ 
    about.home="https://github.com/mengyao/Complete-Striped-Smith-Waterman-Library" \ 
    software.version="1.1-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/ssw-align/copyright" \ 
    extra.binaries="/usr/bin/ssw-align,/usr/bin/ssw_test" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ssw-align && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
