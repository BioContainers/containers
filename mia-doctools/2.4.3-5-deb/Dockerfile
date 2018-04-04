FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mia-doctools" \ 
    container="mia-doctools" \ 
    about.summary="Helper scripts for run-time document creation" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="2.4.3-5-deb" \ 
    version="1" \ 
    about.copyright="Gert Wollny  <gw.fossdev@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/mia-doctools/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mia-doctools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
