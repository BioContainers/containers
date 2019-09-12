FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dicompyler" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dicompyler" \ 
    about.summary="radiation therapy research platform" \ 
    about.home="http://www.dicompyler.com/" \ 
    software.version="0.4.2.0-2-deb" \ 
    upstream.version="0.4.2.0" \ 
    version="1" \ 
    about.copyright=" 2005-2014 Aditya Panchal <apanchal@bastula.org>" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/dicompyler/copyright" \ 
    extra.binaries="/usr/bin/dicompyler" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dicompyler || apt-get install -y dicompyler) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
