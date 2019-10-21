FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rampler" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rampler" \ 
    about.summary="module for sampling genomic sequences" \ 
    about.home="https://github.com/rvaser/rampler" \ 
    software.version="1.1.0-1-deb" \ 
    upstream.version="1.1.0" \ 
    version="1" \ 
    about.copyright="2016-2018 Robert Vaser" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/rampler/copyright" \ 
    extra.binaries="/usr/bin/rampler" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rampler || apt-get install -y rampler) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
