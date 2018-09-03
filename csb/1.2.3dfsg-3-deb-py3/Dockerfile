FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="csb" \ 
    container="csb" \ 
    about.summary="Python framework for structural bioinformatics (Python3 version)" \ 
    about.home="http://csb.codeplex.com/" \ 
    software.version="1.2.3dfsg-3-deb-py3" \ 
    version="1" \ 
    about.copyright="2012-2013 Michael Habeck <mhabeck@gwdg.de>," \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/csb/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-csb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
