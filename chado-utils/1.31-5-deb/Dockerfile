FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="chado-utils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="chado-utils" \ 
    about.summary="tools to add/extract data from Chado" \ 
    about.home="http://gmod.org/wiki/Chado" \ 
    software.version="1.31-5-deb" \ 
    upstream.version="1.31" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/chado-utils/copyright" \ 
    about.license_file="/usr/share/doc/chado-utils/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y chado-utils || apt-get install -y chado-utils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
