FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqan-dev" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seqan-dev" \ 
    about.summary="C++ library for the analysis of biological sequences (development)" \ 
    about.home="http://www.seqan.de/" \ 
    software.version="1.4.2dfsg-3-deb" \ 
    upstream.version="1.4.2" \ 
    version="1" \ 
    extra.identifiers.biotools="seqan" \ 
    about.copyright="2006-2015" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/seqan-dev/copyright" \ 
    about.tags="devel::library, role::devel-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seqan-dev || apt-get install -y seqan-dev) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
