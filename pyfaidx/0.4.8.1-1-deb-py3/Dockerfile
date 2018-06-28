FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyfaidx" \ 
    container="pyfaidx" \ 
    about.summary="efficient random access to fasta subsequences for Python 3" \ 
    about.home="https://github.com/mdshw5/pyfaidx" \ 
    software.version="0.4.8.1-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2013-2015 The Johns Hopkins University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/pyfaidx/copyright" \ 
    extra.binaries="/usr/bin/faidx" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pyfaidx && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
