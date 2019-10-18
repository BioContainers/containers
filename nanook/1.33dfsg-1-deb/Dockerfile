FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nanook" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="nanook" \ 
    about.summary="pre- and post-alignment analysis of nanopore sequencing data" \ 
    about.home="https://documentation.tgac.ac.uk/display/NANOOK/NanoOK" \ 
    software.version="1.33dfsg-1-deb" \ 
    upstream.version="1.33" \ 
    version="1" \ 
    extra.identifiers.biotools="nanook" \ 
    about.copyright="2015-2017 Richard M. Leggett," \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/nanook/copyright" \ 
    extra.binaries="/usr/bin/nanook" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y nanook || apt-get install -y nanook) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
