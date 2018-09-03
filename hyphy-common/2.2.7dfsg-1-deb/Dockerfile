FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hyphy-common" \ 
    container="hyphy-common" \ 
    about.summary="Hypothesis testing using Phylogenies (common files)" \ 
    about.home="http://hyphy.org/" \ 
    software.version="2.2.7dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="1997-2015 Sergei L Kosakovsky Pond <spond@ucsd.edu>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/hyphy-common/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hyphy-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
