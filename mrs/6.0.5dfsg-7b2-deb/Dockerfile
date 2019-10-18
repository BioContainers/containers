FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mrs" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mrs" \ 
    about.summary="Information Retrieval System for Biomedical databanks" \ 
    about.home="http://mrs.cmbi.ru.nl/" \ 
    software.version="6.0.5dfsg-7b2-deb" \ 
    upstream.version="6.0.5" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/mrs/copyright" \ 
    about.license_file="/usr/share/doc/mrs/copyright" \ 
    extra.binaries="/usr/bin/mrs" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mrs || apt-get install -y mrs) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
