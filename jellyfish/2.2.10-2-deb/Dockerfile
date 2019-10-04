FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jellyfish" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="jellyfish" \ 
    about.summary="count k-mers in DNA sequences" \ 
    about.home="http://www.cbcb.umd.edu/software/jellyfish/" \ 
    software.version="2.2.10-2-deb" \ 
    upstream.version="2.2.10" \ 
    version="1" \ 
    extra.identifiers.biotools="jellyfish" \ 
    about.copyright="Copyright 2011-2014 Guillaume Marais1, Carl Kingsford" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/jellyfish/copyright" \ 
    extra.binaries="/usr/bin/jellyfish" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y jellyfish || apt-get install -y jellyfish) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
