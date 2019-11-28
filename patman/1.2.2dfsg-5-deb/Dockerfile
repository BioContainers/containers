FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="patman" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="patman" \ 
    about.summary="rapid alignment of short sequences to large databases" \ 
    about.home="https://bioinf.eva.mpg.de/patman/" \ 
    software.version="1.2.2dfsg-5-deb" \ 
    upstream.version="1.2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="patman" \ 
    about.copyright=" 2008-2009 Kay Pruefer, Udo Stenzel" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/patman/copyright" \ 
    extra.binaries="/usr/bin/patman" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y patman || apt-get install -y patman) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
