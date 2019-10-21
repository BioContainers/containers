FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="qtltools-example" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="qtltools-example" \ 
    about.summary="Tool set for molecular QTL discovery and analysis - example" \ 
    about.home="https://qtltools.github.io/qtltools/" \ 
    software.version="1.1dfsg-3-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    extra.identifiers.biotools="qtltools" \ 
    about.copyright="2016 Olivier Delaneau, Halit Ongen and Emmanouil T. Dermitzakis" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/qtltools-example/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y qtltools-example || apt-get install -y qtltools-example) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
