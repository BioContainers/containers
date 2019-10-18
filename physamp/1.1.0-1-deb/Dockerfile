FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="physamp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="physamp" \ 
    about.summary="sample sequence alignment corresponding to phylogeny" \ 
    about.home="https://jydu.github.io/physamp/" \ 
    software.version="1.1.0-1-deb" \ 
    upstream.version="1.1.0" \ 
    version="1" \ 
    about.copyright="2014-2015 Julien Dutheil <julien.dutheil@univ-montp2.fr>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/physamp/copyright" \ 
    extra.binaries="/usr/bin/bppalnoptim,/usr/bin/bppphysamp" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y physamp || apt-get install -y physamp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
