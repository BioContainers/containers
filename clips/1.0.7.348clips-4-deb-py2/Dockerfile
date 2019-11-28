FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clips" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clips" \ 
    about.summary="Python module to interface the CLIPS expert system shell library" \ 
    about.home="http://sourceforge.net/projects/pyclips/" \ 
    software.version="1.0.7.348clips-4-deb-py2" \ 
    upstream.version="1.0.7.348" \ 
    version="1" \ 
    about.copyright="2002-2008 Francesco Garosi/JKS" \ 
    about.license="LGPL-2" \ 
    about.license_file="/usr/share/doc/clips/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python-clips || apt-get install -y python-clips) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
