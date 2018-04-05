FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python3-skbio" \ 
    container="python3-skbio" \ 
    about.summary="Python3 data structures, algorithms, educational resources for bioinformatic" \ 
    about.home="https://github.com/biocore/scikit-bio" \ 
    software.version="0.5.1-2-deb" \ 
    version="1" \ 
    about.copyright="2013-2015 scikit-bio development team." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/python3-skbio/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-skbio && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
