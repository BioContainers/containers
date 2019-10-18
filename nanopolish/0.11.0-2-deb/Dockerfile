FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="nanopolish" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="nanopolish" \ 
    about.summary="consensus caller for nanopore sequencing data" \ 
    about.home="https://github.com/jts/nanopolish" \ 
    software.version="0.11.0-2-deb" \ 
    upstream.version="0.11.0" \ 
    version="1" \ 
    extra.identifiers.biotools="nanopolish" \ 
    about.copyright="2015-2018 Ontario Institute for Cancer Research" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/nanopolish/copyright" \ 
    extra.binaries="/usr/bin/nanopolish" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y nanopolish || apt-get install -y nanopolish) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
