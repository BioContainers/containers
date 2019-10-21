FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="uc-echo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="uc-echo" \ 
    about.summary="error correction algorithm designed for short-reads from NGS" \ 
    about.home="http://uc-echo.sourceforge.net/" \ 
    software.version="1.12-11-deb" \ 
    upstream.version="1.12" \ 
    version="1" \ 
    about.copyright="2011, Yun S. Song" \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/uc-echo/copyright" \ 
    extra.binaries="/usr/bin/uc-echo" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y uc-echo || apt-get install -y uc-echo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
