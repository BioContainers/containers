FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python-mia" \ 
    container="python-mia" \ 
    about.summary="Python-2 bindings for the MIA image processing library" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="0.1.9-1-deb" \ 
    version="1" \ 
    about.copyright="Gert Wollny  <gw.fossdev@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/python-mia/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-mia && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
