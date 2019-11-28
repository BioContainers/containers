FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cain-solvers" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cain-solvers" \ 
    about.summary="solvers for cain" \ 
    about.home="http://cain.sourceforge.net" \ 
    software.version="1.10dfsg-3-deb" \ 
    upstream.version="1.10" \ 
    version="1" \ 
    about.copyright="1999-2012, California Institute of Technology" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/cain-solvers/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cain-solvers || apt-get install -y cain-solvers) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
