FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="velvetoptimiser" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="velvetoptimiser" \ 
    about.summary="automatically optimise Velvet do novo assembly parameters" \ 
    about.home="https://github.com/tseemann/VelvetOptimiser/" \ 
    software.version="2.2.6-2-deb" \ 
    upstream.version="2.2.6" \ 
    version="1" \ 
    extra.identifiers.biotools="velvetoptimiser" \ 
    about.copyright="2008-2012 Simon Gladman <simon.gladman@monash.edu>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/velvetoptimiser/copyright" \ 
    extra.binaries="/usr/bin/velvetoptimiser" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y velvetoptimiser || apt-get install -y velvetoptimiser) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
