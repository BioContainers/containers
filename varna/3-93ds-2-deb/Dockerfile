FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="varna" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="varna" \ 
    about.summary="Visualization Applet for RNA" \ 
    about.home="http://varna.lri.fr/" \ 
    software.version="3-93ds-2-deb" \ 
    upstream.version="3" \ 
    version="1" \ 
    about.copyright=" 2008  Kevin Darty, Alain Denise and Yann Ponty <Yann.Ponty@lri.fr>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/varna/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y varna || apt-get install -y varna) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
