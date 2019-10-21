FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="wgerman-medical" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="wgerman-medical" \ 
    about.summary="German medical dictionary words for /usr/share/dict" \ 
    about.home="https://github.com/toddy15/medicalterms" \ 
    software.version="20160103-3-deb" \ 
    upstream.version="20160103" \ 
    version="1" \ 
    about.copyright=" 2005-2016 Dr. Tobias Quathamer <toddy@debian.org>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/wgerman-medical/copyright" \ 
    about.tags="culture::german, made-of::dictionary, role::app-data, use::checking" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y wgerman-medical || apt-get install -y wgerman-medical) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
