FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="openslide" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="openslide" \ 
    about.summary="Python 3 wrapper for reading whole slide image files" \ 
    about.home="http://openslide.org" \ 
    software.version="1.1.1-4-deb-py3" \ 
    upstream.version="1.1.1" \ 
    version="1" \ 
    about.copyright=" 2010-2014 Carnegie Mellon University" \ 
    about.license="LGPL-2.1" \ 
    about.license_file="/usr/share/doc/openslide/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-openslide || apt-get install -y python3-openslide) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
