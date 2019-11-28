FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle-utils" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mobyle-utils" \ 
    about.summary="binary tools used by Mobyle" \ 
    about.home="https://projets.pasteur.fr/projects/mobyle" \ 
    software.version="1.5.5dfsg-6-deb" \ 
    upstream.version="1.5.5" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle-utils/copyright" \ 
    extra.binaries="/usr/bin/mobyle-setsid" \ 
    about.tags="implemented-in::c, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mobyle-utils || apt-get install -y mobyle-utils) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
