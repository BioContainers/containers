FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vsearch" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="vsearch" \ 
    about.summary="tool for processing metagenomic sequences" \ 
    about.home="https://github.com/torognes/vsearch/" \ 
    software.version="2.10.4-1-deb" \ 
    upstream.version="2.10.4" \ 
    version="1" \ 
    extra.identifiers.biotools="vsearch" \ 
    about.copyright=" 2014-2015 Torbjorn Rognes <torognes@ifi.uio.no>," \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/vsearch/copyright" \ 
    extra.binaries="/usr/bin/vsearch" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y vsearch || apt-get install -y vsearch) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
