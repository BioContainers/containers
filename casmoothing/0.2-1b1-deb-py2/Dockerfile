FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="casmoothing" \ 
    container="casmoothing" \ 
    about.summary="Context-aware mesh smoothing for biomedical applications" \ 
    about.home="https://github.com/tfmoraes/python-casmoothing" \ 
    software.version="0.2-1b1-deb-py2" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/casmoothing/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-casmoothing && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
