FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="xopen" \ 
    container="xopen" \ 
    about.summary="Python module to open compressed files transparently" \ 
    about.home="https://github.com/marcelm/xopen" \ 
    software.version="0.1.1-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2010-2016 Marcel Martin <mail@marcelm.net>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/xopen/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-xopen && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
