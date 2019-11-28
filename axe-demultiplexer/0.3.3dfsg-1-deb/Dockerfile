FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="axe-demultiplexer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="axe-demultiplexer" \ 
    about.summary="Trie-based DNA sequencing read demultiplexer" \ 
    about.home="https://github.com/kdmurray91/axe" \ 
    software.version="0.3.3dfsg-1-deb" \ 
    upstream.version="0.3.3" \ 
    version="1" \ 
    about.copyright="2014-2015 Kevin Murray" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/axe-demultiplexer/copyright" \ 
    extra.binaries="/usr/bin/axe-demux" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y axe-demultiplexer || apt-get install -y axe-demultiplexer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
