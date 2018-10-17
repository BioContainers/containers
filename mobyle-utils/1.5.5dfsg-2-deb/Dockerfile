FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle-utils" \ 
    container="mobyle-utils" \ 
    about.summary="binary tools used by Mobyle" \ 
    about.home="https://projets.pasteur.fr/projects/mobyle" \ 
    software.version="1.5.5dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle-utils/copyright" \ 
    extra.binaries="/usr/bin/mobyle-setsid" \ 
    about.tags="implemented-in::c, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mobyle-utils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
