FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="reprof" \ 
    container="reprof" \ 
    about.summary="protein secondary structure and accessibility predictor" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.0.1-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="reprof" \ 
    about.copyright="" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/reprof/copyright" \ 
    extra.binaries="/usr/bin/reprof" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y reprof && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
