FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="physamp" \ 
    container="physamp" \ 
    about.summary="sample sequence alignment according to its corresponding phylogenetic tree" \ 
    about.home="http://biopp.univ-montp2.fr/forge/physamp" \ 
    software.version="0.2.0-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/physamp/copyright" \ 
    extra.binaries="/usr/bin/bppalnoptim" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y physamp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
