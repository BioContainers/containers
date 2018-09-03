FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hyphy-pt" \ 
    container="hyphy-pt" \ 
    about.summary="Hypothesis testing using Phylogenies (pthreads version)" \ 
    about.home="http://hyphy.org/" \ 
    software.version="2.2.7dfsg-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/hyphy-pt/copyright" \ 
    extra.binaries="/usr/bin/hyphymp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hyphy-pt && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
