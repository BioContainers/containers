FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-csb" \ 
    container="python-csb" \ 
    about.summary="Python framework for structural bioinformatics" \ 
    about.home="http://csb.codeplex.com/" \ 
    software.version="1.2.3dfsg-3-deb" \ 
    version="1" \ 
    about.copyright="2012-2013 Michael Habeck <mhabeck@gwdg.de>," \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/python-csb/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-csb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
