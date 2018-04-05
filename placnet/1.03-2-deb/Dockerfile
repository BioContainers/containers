FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="placnet" \ 
    container="placnet" \ 
    about.summary="Plasmid Constellation Network project" \ 
    about.home="http://sourceforge.net/projects/placnet/" \ 
    software.version="1.03-2-deb" \ 
    version="1" \ 
    about.copyright="2013-2015 Val F. Lanza <valfernandez.vf@gmail.com>," \ 
    about.license="CC-4.0" \ 
    about.license_file="/usr/share/doc/placnet/copyright" \ 
    extra.binaries="/usr/bin/placnet" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y placnet && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
