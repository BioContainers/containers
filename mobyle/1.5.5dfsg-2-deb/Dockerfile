FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle" \ 
    container="mobyle" \ 
    about.summary="Web portal that provides web forms for command-line software" \ 
    about.home="https://projets.pasteur.fr/projects/mobyle" \ 
    software.version="1.5.5dfsg-2-deb" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle/copyright" \ 
    about.tags="devel::web, field::biology, field::biology:bioinformatics,:python, interface::web, role::program,:application,:cgi" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mobyle && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
