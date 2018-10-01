FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rampler" \ 
    container="rampler" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    about.summary="module for sampling genomic sequences" \ 
    about.home="https://github.com/rvaser/rampler" \ 
    software.version="1.1.0-1bpo91-deb" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/rampler/copyright" \
    about.license_file="/usr/share/doc/rampler/copyright" \ 
    extra.binaries="/usr/bin/rampler" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rampler && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
