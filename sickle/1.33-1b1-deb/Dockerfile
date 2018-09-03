FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sickle" \ 
    container="sickle" \ 
    about.summary="windowed adaptive trimming tool for FASTQ files using quality" \ 
    about.home="https://github.com/najoshi/sickle" \ 
    software.version="1.33-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sickle/copyright" \ 
    extra.binaries="/usr/bin/sickle" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sickle && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
