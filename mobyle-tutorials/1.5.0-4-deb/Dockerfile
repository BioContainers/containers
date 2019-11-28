FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle-tutorials" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mobyle-tutorials" \ 
    about.summary="program tutorials for the mobyle portal" \ 
    about.home="https://projets.pasteur.fr/projects/mobyle/wiki/Download" \ 
    software.version="1.5.0-4-deb" \ 
    upstream.version="1.5.0" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="LGPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle-tutorials/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mobyle-tutorials || apt-get install -y mobyle-tutorials) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
