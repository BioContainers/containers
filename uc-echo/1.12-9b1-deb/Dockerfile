FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="uc-echo" \ 
    container="uc-echo" \ 
    about.summary="error correction algorithm designed for short-reads from NGS" \ 
    about.home="http://uc-echo.sourceforge.net/" \ 
    software.version="1.12-9b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/uc-echo/copyright" \ 
    extra.binaries="/usr/bin/uc-echo" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y uc-echo && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
