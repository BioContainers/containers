FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="staden" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="staden" \ 
    about.summary="DNA sequence assembly (Gap4/Gap5), editing and analysis tools" \ 
    about.home="https://sourceforge.net/projects/staden/" \ 
    software.version="2.0.0b11-4-deb" \ 
    upstream.version="2.0.0" \ 
    version="1" \ 
    extra.identifiers.biotools="staden" \ 
    about.copyright="1995-2001 Medical Research Council, Laboratory of Molecular Biology" \ 
    about.license="BSD-like" \ 
    about.license_file="/usr/share/doc/staden/copyright" \ 
    extra.binaries="/usr/bin/gap4,/usr/bin/gap5,/usr/bin/pregap4,/usr/bin/staden,/usr/bin/trev" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y staden || apt-get install -y staden) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
