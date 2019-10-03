FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hyphy-common" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="hyphy-common" \ 
    about.summary="Hypothesis testing using Phylogenies (common files)" \ 
    about.home="http://hyphy.org/" \ 
    software.version="2.3.14dfsg-1-deb" \ 
    upstream.version="2.3.14" \ 
    version="1" \ 
    extra.identifiers.biotools="hyphy" \ 
    about.copyright="1997-2015 Sergei L Kosakovsky Pond <spond@ucsd.edu>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/hyphy-common/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y hyphy-common || apt-get install -y hyphy-common) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
