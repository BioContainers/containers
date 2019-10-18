FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plasmidseeker" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plasmidseeker" \ 
    about.summary="identification of known plasmids from whole-genome sequencing reads" \ 
    about.home="https://github.com/bioinfo-ut/PlasmidSeeker" \ 
    software.version="1.0dfsg-1-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    about.copyright="2017-2018 Bioinfo, IMCB, UT" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/plasmidseeker/copyright" \ 
    extra.binaries="/usr/bin/plasmidseeker" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plasmidseeker || apt-get install -y plasmidseeker) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
