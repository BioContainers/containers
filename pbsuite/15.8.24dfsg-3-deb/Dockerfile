FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbsuite" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbsuite" \ 
    about.summary="software for Pacific Biosciences sequencing data" \ 
    about.home="http://sourceforge.net/projects/pb-jelly" \ 
    software.version="15.8.24dfsg-3-deb" \ 
    upstream.version="15.8.24" \ 
    version="1" \ 
    about.copyright="2013 Baylor College of Medicine" \ 
    about.license="BSD-2-Clause" \ 
    about.license_file="/usr/share/doc/pbsuite/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pbsuite || apt-get install -y pbsuite) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
