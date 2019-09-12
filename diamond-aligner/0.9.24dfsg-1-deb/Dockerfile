FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="diamond-aligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="diamond-aligner" \ 
    about.summary="accelerated BLAST compatible local sequence aligner" \ 
    about.home="https://github.com/bbuchfink/diamond" \ 
    software.version="0.9.24dfsg-1-deb" \ 
    upstream.version="0.9.24" \ 
    version="1" \ 
    about.copyright="2014-2016, University of Tuebingen, Benjamin Buchfink" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/diamond-aligner/copyright" \ 
    extra.binaries="/usr/bin/diamond-aligner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y diamond-aligner || apt-get install -y diamond-aligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
