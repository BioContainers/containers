FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pyfaidx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pyfaidx" \ 
    about.summary="efficient random access to fasta subsequences for Python" \ 
    about.home="https://github.com/mdshw5/pyfaidx" \ 
    software.version="0.5.5.2-1-deb-py2" \ 
    upstream.version="0.5.5.2" \ 
    version="1" \ 
    about.copyright="2013-2015 The Johns Hopkins University" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/pyfaidx/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-pyfaidx || apt-get install -y python-pyfaidx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
