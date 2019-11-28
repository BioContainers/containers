FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="placnet" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="placnet" \ 
    about.summary="Plasmid Constellation Network project" \ 
    about.home="http://sourceforge.net/projects/placnet/" \ 
    software.version="1.03-3-deb" \ 
    upstream.version="1.03" \ 
    version="1" \ 
    about.copyright="2013-2015 Val F. Lanza <valfernandez.vf@gmail.com>," \ 
    about.license="CC-4.0" \ 
    about.license_file="/usr/share/doc/placnet/copyright" \ 
    extra.binaries="/usr/bin/placnet" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y placnet || apt-get install -y placnet) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
