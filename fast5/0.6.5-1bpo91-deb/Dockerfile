FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fast5" \ 
    container="fast5" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    about.summary="utilities for manipulating Oxford Nanopore Fast5 files" \ 
    about.home="https://github.com/mateidavid/fast5" \ 
    software.version="0.6.5-1bpo91-deb" \ 
    version="1" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/fast5/copyright" \ 
    extra.binaries="/usr/bin/f5ls,/usr/bin/f5pack" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fast5 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
