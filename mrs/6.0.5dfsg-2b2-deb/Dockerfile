FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mrs" \ 
    container="mrs" \ 
    about.summary="Information Retrieval System for Biomedical databanks" \ 
    about.home="http://mrs.cmbi.ru.nl/" \ 
    software.version="6.0.5dfsg-2b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/mrs/copyright" \ 
    extra.binaries="/usr/bin/mrs" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mrs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
