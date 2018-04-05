FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-fast5" \ 
    container="python-fast5" \ 
    about.summary="library for reading Oxford Nanopore Fast5 files -- Python 2" \ 
    about.home="https://github.com/mateidavid/fast5" \ 
    software.version="0.5.8-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/python-fast5/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-fast5 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
