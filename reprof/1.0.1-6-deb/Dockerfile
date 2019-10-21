FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="reprof" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="reprof" \ 
    about.summary="protein secondary structure and accessibility predictor" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.0.1-6-deb" \ 
    upstream.version="1.0.1" \ 
    version="1" \ 
    extra.identifiers.biotools="reprof" \ 
    about.copyright="" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/reprof/copyright" \ 
    extra.binaries="/usr/bin/reprof" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y reprof || apt-get install -y reprof) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
