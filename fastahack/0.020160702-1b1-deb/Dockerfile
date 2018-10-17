FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastahack" \ 
    container="fastahack" \ 
    about.summary="utility for indexing and sequence extraction from FASTA files" \ 
    about.home="https://github.com/ekg/fastahack" \ 
    software.version="0.020160702-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/fastahack/copyright" \ 
    extra.binaries="/usr/bin/fastahack" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastahack && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
