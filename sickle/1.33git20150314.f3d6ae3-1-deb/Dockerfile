FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sickle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sickle" \ 
    about.summary="windowed adaptive trimming tool for FASTQ files using quality" \ 
    about.home="https://github.com/najoshi/sickle" \ 
    software.version="1.33git20150314.f3d6ae3-1-deb" \ 
    upstream.version="1.33" \ 
    version="1" \ 
    extra.identifiers.biotools="sickle" \ 
    about.copyright="2008 Genome Research Ltd (GRL).," \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/sickle/copyright" \ 
    extra.binaries="/usr/bin/sickle" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sickle || apt-get install -y sickle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
