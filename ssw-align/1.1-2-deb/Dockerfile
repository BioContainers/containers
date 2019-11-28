FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ssw-align" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ssw-align" \ 
    about.summary="Smith-Waterman aligner based on libssw" \ 
    about.home="https://github.com/mengyao/Complete-Striped-Smith-Waterman-Library" \ 
    software.version="1.1-2-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ssw-align/copyright" \ 
    about.license_file="/usr/share/doc/ssw-align/copyright" \ 
    extra.binaries="/usr/bin/ssw-align,/usr/bin/ssw_test" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ssw-align || apt-get install -y ssw-align) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
