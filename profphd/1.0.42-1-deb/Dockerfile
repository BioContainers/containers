FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profphd" \ 
    container="profphd" \ 
    about.summary="secondary structure and solvent accessibility predictor" \ 
    about.home="http://predictprotein.org/" \ 
    software.version="1.0.42-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/profphd/copyright" \ 
    extra.binaries="/usr/bin/prof" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y profphd && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
