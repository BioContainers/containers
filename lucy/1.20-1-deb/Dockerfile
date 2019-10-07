FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="lucy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="lucy" \ 
    about.summary="DNA sequence quality and vector trimming tool" \ 
    about.home="https://lucy.sourceforge.net" \ 
    software.version="1.20-1-deb" \ 
    upstream.version="1.20" \ 
    version="1" \ 
    extra.identifiers.biotools="lucy" \ 
    about.copyright="1999-2008 The Institute for Genomic Research (TIGR), Rockville, Maryland, USA" \ 
    about.license="Artistic-1.0" \ 
    about.license_file="/usr/share/doc/lucy/copyright" \ 
    extra.binaries="/usr/bin/lucy" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y lucy || apt-get install -y lucy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
