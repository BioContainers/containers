FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="salmid" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="salmid" \ 
    about.summary="rapid Kmer based Salmonella identifier from sequence data" \ 
    about.home="https://github.com/hcdenbakker/SalmID" \ 
    software.version="0.1.23-1-deb" \ 
    upstream.version="0.1.23" \ 
    version="1" \ 
    about.copyright="2017 Henk den Bakker" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/salmid/copyright" \ 
    extra.binaries="/usr/bin/SalmID" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y salmid || apt-get install -y salmid) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
