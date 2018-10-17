FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mhap" \ 
    container="mhap" \ 
    about.summary="locality-sensitive hashing to detect long-read overlaps" \ 
    about.home="http://mhap.readthedocs.org/en/stable/" \ 
    software.version="2.1.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2015 Konstantin Berlin <kberlin@umd.edu>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/mhap/copyright" \ 
    extra.binaries="/usr/bin/mhap" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mhap && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
