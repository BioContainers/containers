FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="grabix" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="grabix" \ 
    about.summary="wee tool for random access into BGZF files" \ 
    about.home="https://github.com/arq5x/grabix" \ 
    software.version="0.1.7-1-deb" \ 
    upstream.version="0.1.7" \ 
    version="1" \ 
    about.copyright="2015 Brent Pedersen and Aaron Quinlan" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/grabix/copyright" \ 
    extra.binaries="/usr/bin/grabix" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y grabix || apt-get install -y grabix) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
