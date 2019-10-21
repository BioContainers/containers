FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="stacks-web" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="stacks-web" \ 
    about.summary="web interface for displaying loci from short-read sequences" \ 
    about.home="http://creskolab.uoregon.edu/stacks/" \ 
    software.version="2.2dfsg-1-deb" \ 
    upstream.version="2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="stacks" \ 
    about.copyright=" Julian Catchen <jcatchen@uoregon.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/stacks-web/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y stacks-web || apt-get install -y stacks-web) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
