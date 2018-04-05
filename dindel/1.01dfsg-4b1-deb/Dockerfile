FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dindel" \ 
    container="dindel" \ 
    about.summary="determines indel calls from short-read data" \ 
    about.home="https://sites.google.com/site/keesalbers/soft/dindel" \ 
    software.version="1.01dfsg-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/dindel/copyright" \ 
    extra.binaries="/usr/bin/dindel" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dindel && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
