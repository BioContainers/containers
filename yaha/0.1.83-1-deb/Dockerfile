FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="yaha" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="yaha" \ 
    about.summary="find split-read mappings on single-end queries" \ 
    about.home="https://github.com/GregoryFaust/yaha" \ 
    software.version="0.1.83-1-deb" \ 
    upstream.version="0.1.83" \ 
    version="1" \ 
    about.copyright="2009-2015 Gregory G. Faust" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/yaha/copyright" \ 
    extra.binaries="/usr/bin/yaha" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y yaha || apt-get install -y yaha) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
