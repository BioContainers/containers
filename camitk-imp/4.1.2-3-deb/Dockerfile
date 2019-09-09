FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="camitk-imp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="camitk-imp" \ 
    about.summary="workbench application for the CamiTK library" \ 
    about.home="https://camitk.imag.fr/" \ 
    software.version="4.1.2-3-deb" \ 
    upstream.version="4.1.2" \ 
    version="1" \ 
    about.copyright=" 2001-2017 Emmanuel Promayon <Emmanuel.Promayon@univ-grenoble-alpes.fr>, Celine Fouard <Celine.Fouard@univ-grenoble-alpes.fr>" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/camitk-imp/copyright" \ 
    extra.binaries="/usr/bin/camitk-imp" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::qt, use::viewing,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y camitk-imp || apt-get install -y camitk-imp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
