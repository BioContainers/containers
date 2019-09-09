FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clearcut" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clearcut" \ 
    about.summary="extremely efficient phylogenetic tree reconstruction" \ 
    about.home="http://bioinformatics.hungry.com/clearcut/" \ 
    software.version="1.0.9-3-deb" \ 
    upstream.version="1.0.9" \ 
    version="1" \ 
    about.copyright="Copyright (c) 2004,  Luke Sheneman" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/clearcut/copyright" \ 
    extra.binaries="/usr/bin/clearcut" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clearcut || apt-get install -y clearcut) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
