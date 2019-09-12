FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edtsurf" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="edtsurf" \ 
    about.summary="triangulated mesh surfaces for protein structures" \ 
    about.home="http://zhanglab.ccmb.med.umich.edu/EDTSurf/" \ 
    software.version="0.2009-6-deb" \ 
    upstream.version="0.2009" \ 
    version="1" \ 
    about.copyright="2009 Dong Xu and Yang Zhang <zhng@umich.edu>" \ 
    about.license="as_is" \ 
    about.license_file="/usr/share/doc/edtsurf/copyright" \ 
    extra.binaries="/usr/bin/EDTSurf" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y edtsurf || apt-get install -y edtsurf) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
