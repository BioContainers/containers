FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biosyntax" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="biosyntax" \ 
    about.summary="Syntax Highlighting for Computational Biology (metapackage)" \ 
    about.home="https://biosyntax.org/" \ 
    software.version="1.0.0b-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="biosyntax" \ 
    about.copyright="2017-2018 Artem Babaian, Anicet Ebou, Alyssa Fegen, Ho Yin Jeffrey Kam, German E Novakovsky and Jasper Wong" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/biosyntax/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y biosyntax || apt-get install -y biosyntax) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
