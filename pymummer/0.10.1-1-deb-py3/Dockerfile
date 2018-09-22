FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pymummer" \ 
    container="pymummer" \ 
    about.summary="Python 3 interface to MUMmer" \ 
    about.home="https://github.com/sanger-pathogens/pymummer" \ 
    software.version="0.10.1-1-deb-py3" \ 
    version="1" \ 
    about.copyright="2015-2016 Martin Hunt and Nishadi De Silva" \ 
    about.license="GPL-3.0" \ 
    about.license_file="/usr/share/doc/pymummer/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-pymummer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
