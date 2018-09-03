FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clearcut" \ 
    container="clearcut" \ 
    about.summary="extremely efficient phylogenetic tree reconstruction" \ 
    about.home="http://bioinformatics.hungry.com/clearcut/" \ 
    software.version="1.0.9-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/clearcut/copyright" \ 
    extra.binaries="/usr/bin/clearcut" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clearcut && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
