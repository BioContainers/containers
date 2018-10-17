FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freecontact" \ 
    container="freecontact" \ 
    about.summary="fast protein contact predictor - binding for Python" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.1-2b2-deb-py2" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/freecontact/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-freecontact && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
