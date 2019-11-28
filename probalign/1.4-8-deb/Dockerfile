FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="probalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="probalign" \ 
    about.summary="multiple sequence alignment using partition function posterior probabilities" \ 
    about.home="http://probalign.njit.edu/standalone.html" \ 
    software.version="1.4-8-deb" \ 
    upstream.version="1.4" \ 
    version="1" \ 
    about.copyright=" 2010 Satish Chikkagoudar and Usman Roshan" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/probalign/copyright" \ 
    extra.binaries="/usr/bin/probalign" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y probalign || apt-get install -y probalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
