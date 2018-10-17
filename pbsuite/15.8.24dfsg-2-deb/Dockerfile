FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbsuite" \ 
    container="pbsuite" \ 
    about.summary="software for Pacific Biosciences sequencing data" \ 
    about.home="http://sourceforge.net/projects/pb-jelly" \ 
    software.version="15.8.24dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2013 Baylor College of Medicine" \ 
    about.license="BSD-2-Clause" \ 
    about.license_file="/usr/share/doc/pbsuite/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbsuite && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
