FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kissplice" \ 
    container="kissplice" \ 
    about.summary="Detection of various kinds of polymorphisms in RNA-seq data" \ 
    about.home="http://kissplice.prabi.fr/" \ 
    software.version="2.4.0-p1-1-deb" \ 
    version="1" \ 
    about.copyright="2011 - 2013 Vincent Lacroix" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/kissplice/copyright" \ 
    extra.binaries="/usr/bin/kissplice" \ 
    extra.identifiers.conda="kissplice" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y kissplice && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
