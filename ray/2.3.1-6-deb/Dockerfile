FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ray" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ray" \ 
    about.summary="de novo genome assemblies of next-gen sequencing data" \ 
    about.home="http://denovoassembler.sourceforge.net/" \ 
    software.version="2.3.1-6-deb" \ 
    upstream.version="2.3.1" \ 
    version="1" \ 
    extra.identifiers.biotools="ray" \ 
    about.copyright="2009-2014 Sbastien Boisvert" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/ray/copyright" \ 
    extra.binaries="/usr/bin/Ray" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ray || apt-get install -y ray) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
