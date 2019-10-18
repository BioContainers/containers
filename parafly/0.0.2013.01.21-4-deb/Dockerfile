FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="parafly" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="parafly" \ 
    about.summary="parallel command processing using OpenMP" \ 
    about.home="http://parafly.sourceforge.net" \ 
    software.version="0.0.2013.01.21-4-deb" \ 
    upstream.version="0.0.2013.01.21" \ 
    version="1" \ 
    about.copyright="(c) 2011, The Broad Institute, Inc. All rights reserved." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/parafly/copyright" \ 
    extra.binaries="/usr/bin/ParaFly" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y parafly || apt-get install -y parafly) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
