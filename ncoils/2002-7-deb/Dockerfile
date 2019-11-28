FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncoils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncoils" \ 
    about.summary="coiled coil secondary structure prediction" \ 
    about.home="http://www.russelllab.org/coils/" \ 
    software.version="2002-7-deb" \ 
    upstream.version="2002" \ 
    version="1" \ 
    extra.identifiers.biotools="coils" \ 
    about.copyright="(C) 2002 Robert B. Russel and its employing institute, the" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/ncoils/copyright" \ 
    extra.binaries="/usr/bin/coils-wrap,/usr/bin/ncoils" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncoils || apt-get install -y ncoils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
