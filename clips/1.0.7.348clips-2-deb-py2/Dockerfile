FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clips" \ 
    container="clips" \ 
    about.summary="Python module to interface the CLIPS expert system shell library" \ 
    about.home="http://sourceforge.net/projects/pyclips/" \ 
    software.version="1.0.7.348clips-2-deb-py2" \ 
    version="1" \ 
    about.copyright="2002-2008 Francesco Garosi/JKS" \ 
    about.license="LGPL-2" \ 
    about.license_file="/usr/share/doc/clips/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-clips && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
