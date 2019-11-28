FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="camitk-actionstatemachine" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="camitk-actionstatemachine" \ 
    about.summary="pipeline replay application for the CamiTK library" \ 
    about.home="https://camitk.imag.fr/" \ 
    software.version="4.1.2-3-deb" \ 
    upstream.version="4.1.2" \ 
    version="1" \ 
    about.copyright=" 2001-2017 Emmanuel Promayon <Emmanuel.Promayon@univ-grenoble-alpes.fr>, Celine Fouard <Celine.Fouard@univ-grenoble-alpes.fr>" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/camitk-actionstatemachine/copyright" \ 
    extra.binaries="/usr/bin/camitk-actionstatemachine" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y camitk-actionstatemachine || apt-get install -y camitk-actionstatemachine) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
