FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="stacks" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="stacks" \ 
    about.summary="pipeline for building loci from short-read DNA sequences" \ 
    about.home="http://creskolab.uoregon.edu/stacks/" \ 
    software.version="2.2dfsg-1-deb" \ 
    upstream.version="2.2" \ 
    version="1" \ 
    extra.identifiers.biotools="stacks" \ 
    about.copyright=" Julian Catchen <jcatchen@uoregon.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/stacks/copyright" \ 
    extra.binaries="/usr/bin/stacks" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y stacks || apt-get install -y stacks) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
