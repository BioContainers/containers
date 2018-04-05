FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python3-xopen" \ 
    container="python3-xopen" \ 
    about.summary="Python3 module to open compressed files transparently" \ 
    about.home="https://github.com/marcelm/xopen" \ 
    software.version="0.1.1-1-deb" \ 
    version="1" \ 
    about.copyright="2010-2016 Marcel Martin <mail@marcelm.net>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/python3-xopen/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-xopen && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
