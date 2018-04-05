FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rtax" \ 
    container="rtax" \ 
    about.summary="Classification of sequence reads of 16S ribosomal RNA gene" \ 
    about.home="https://github.com/davidsoergel/rtax/" \ 
    software.version="0.984-5-deb" \ 
    version="1" \ 
    about.copyright=" 2011 Regents of the University of California" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/rtax/copyright" \ 
    extra.binaries="/usr/bin/rtax" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rtax && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
