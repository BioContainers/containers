FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="trinityrnaseq" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="trinityrnaseq" \ 
    about.summary="RNA-Seq De novo Assembly" \ 
    about.home="http://trinityrnaseq.github.io/" \ 
    software.version="2.6.6dfsg-6-deb" \ 
    upstream.version="2.6.6" \ 
    version="1" \ 
    about.copyright="2011 The Broad Institute, Inc" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/trinityrnaseq/copyright" \ 
    extra.binaries="/usr/bin/Trinity" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y trinityrnaseq || apt-get install -y trinityrnaseq) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
