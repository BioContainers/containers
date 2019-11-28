FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edlib-aligner" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="edlib-aligner" \ 
    about.summary="edlib sequence alignment tool using edit distance" \ 
    about.home="https://github.com/Martinsos/edlib" \ 
    software.version="1.2.4-1-deb" \ 
    upstream.version="1.2.4" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/edlib-aligner/copyright" \ 
    about.license_file="/usr/share/doc/edlib-aligner/copyright" \ 
    extra.binaries="/usr/bin/edlib-aligner" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y edlib-aligner || apt-get install -y edlib-aligner) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
