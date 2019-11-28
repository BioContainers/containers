FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cain" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cain" \ 
    about.summary="simulations of chemical reactions" \ 
    about.home="http://cain.sourceforge.net" \ 
    software.version="1.10dfsg-3-deb" \ 
    upstream.version="1.10" \ 
    version="1" \ 
    about.copyright="1999-2012, California Institute of Technology" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/cain/copyright" \ 
    extra.binaries="/usr/bin/cain" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cain || apt-get install -y cain) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
