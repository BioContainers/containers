FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kissplice" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="kissplice" \ 
    about.summary="Detection of various kinds of polymorphisms in RNA-seq data" \ 
    about.home="http://kissplice.prabi.fr/" \ 
    software.version="2.4.0-p1-4-deb" \ 
    upstream.version="2.4.0" \ 
    version="1" \ 
    about.copyright="2011 - 2013 Vincent Lacroix" \ 
    about.license="CeCILL" \ 
    about.license_file="/usr/share/doc/kissplice/copyright" \ 
    extra.binaries="/usr/bin/kissplice" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y kissplice || apt-get install -y kissplice) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
