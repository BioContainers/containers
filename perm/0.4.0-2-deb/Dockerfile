FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="perm" \ 
    container="perm" \ 
    about.summary="efficient mapping of short reads with periodic spaced seeds" \ 
    about.home="https://omictools.com/perm-tool" \ 
    software.version="0.4.0-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="perm" \ 
    about.copyright="(c) 2009 Yangho Chen et al. <yanghoch@usc.edu>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/perm/copyright" \ 
    extra.binaries="/usr/bin/PerM,/usr/bin/perm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y perm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
