FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="axe-demultiplexer" \ 
    container="axe-demultiplexer" \ 
    about.summary="Trie-based DNA sequencing read demultiplexer" \ 
    about.home="https://github.com/kdmurray91/axe" \ 
    software.version="0.3.2dfsg1-1-deb" \ 
    version="1" \ 
    about.copyright="2014-2015 Kevin Murray" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/axe-demultiplexer/copyright" \ 
    extra.binaries="/usr/bin/axe-demux" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y axe-demultiplexer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
