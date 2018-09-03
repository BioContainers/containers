FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="camitk-actionstatemachine" \ 
    container="camitk-actionstatemachine" \ 
    about.summary="pipeline replay application for the CamiTK library" \ 
    about.home="http://camitk.imag.fr/" \ 
    software.version="4.0.4-2-deb" \ 
    version="1" \ 
    about.copyright=" 2001-2017 Emmanuel Promayon <Emmanuel.Promayon@univ-grenoble-alpes.fr>, Celine Fouard <Celine.Fouard@univ-grenoble-alpes.fr>" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/camitk-actionstatemachine/copyright" \ 
    extra.binaries="/usr/bin/camitk-actionstatemachine" \ 
    about.tags="uitoolkit::qt" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y camitk-actionstatemachine && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
