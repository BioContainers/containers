FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="subread-data" \ 
    container="subread-data" \ 
    about.summary="data files for subread package" \ 
    about.home="http://sourceforge.net/projects/subread/" \ 
    software.version="1.5.1dfsg-4-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="subread" \ 
    about.copyright="2011-2015, Dr Yang Liao, Dr Wei Shi" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/subread-data/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y subread-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
