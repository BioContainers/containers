FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pymummer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pymummer" \ 
    about.summary="Python 3 interface to MUMmer" \ 
    about.home="https://github.com/sanger-pathogens/pymummer" \ 
    software.version="0.10.3-2-deb-py3" \ 
    upstream.version="0.10.3" \ 
    version="1" \ 
    about.copyright="2015-2016 Martin Hunt and Nishadi De Silva" \ 
    about.license="GPL-3.0" \ 
    about.license_file="/usr/share/doc/pymummer/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-pymummer || apt-get install -y python3-pymummer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
