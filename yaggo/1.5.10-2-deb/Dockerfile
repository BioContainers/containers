FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="yaggo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="yaggo" \ 
    about.summary="generate command line parser using getopt_long" \ 
    about.home="https://github.com/gmarcais/yaggo" \ 
    software.version="1.5.10-2-deb" \ 
    upstream.version="1.5.10" \ 
    version="1" \ 
    about.copyright="2012-2014 Guillaume Marais <gmarcais@umd.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/yaggo/copyright" \ 
    extra.binaries="/usr/bin/yaggo" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y yaggo || apt-get install -y yaggo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
