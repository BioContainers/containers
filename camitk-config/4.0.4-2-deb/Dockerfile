FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="camitk-config" \ 
    container="camitk-config" \ 
    about.summary="Computer Assisted Medical Intervention Tool Kit - config" \ 
    about.home="http://camitk.imag.fr/" \ 
    software.version="4.0.4-2-deb" \ 
    version="1" \ 
    about.copyright=" 2001-2017 Emmanuel Promayon <Emmanuel.Promayon@univ-grenoble-alpes.fr>, Celine Fouard <Celine.Fouard@univ-grenoble-alpes.fr>" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/camitk-config/copyright" \ 
    extra.binaries="/usr/bin/camitk-config" \ 
    about.tags="uitoolkit::qt" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y camitk-config && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
