FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mobyle-programs" \ 
    container="mobyle-programs" \ 
    about.summary="Program descriptions for the mobyle portal" \ 
    about.home="https://projets.pasteur.fr/projects/show/mobyle" \ 
    software.version="5.1.2-1-deb" \ 
    version="1" \ 
    about.copyright="2011 Herve Menager <hmenager@pasteur.fr>" \ 
    about.license="LGPL-2+" \ 
    about.license_file="/usr/share/doc/mobyle-programs/copyright" \ 
    about.tags="devel::examples, field::biology:bioinformatics, role::examples" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mobyle-programs && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
