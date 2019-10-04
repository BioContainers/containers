FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jellyfish1" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="jellyfish1" \ 
    about.summary="count k-mers in DNA sequences" \ 
    about.home="http://www.cbcb.umd.edu/software/jellyfish/" \ 
    software.version="1.1.11-4-deb" \ 
    upstream.version="1.1.11" \ 
    version="1" \ 
    about.copyright="Copyright 2011 Guillaume Marais1, Carl Kingsford" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/jellyfish1/copyright" \ 
    extra.binaries="/usr/bin/jellyfish1" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y jellyfish1 || apt-get install -y jellyfish1) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
