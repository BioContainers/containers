FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="garli" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="garli" \ 
    about.summary="phylogenetic analysis of molecular sequence data using maximum-likelihood" \ 
    about.home="https://github.com/Ashod/garli" \ 
    software.version="2.1-3-deb" \ 
    upstream.version="2.1" \ 
    version="1" \ 
    about.copyright="2005-2014 Ashod Nakashian, Derrick J. Zwickl," \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/garli/copyright" \ 
    extra.binaries="/usr/bin/garli" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y garli || apt-get install -y garli) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
