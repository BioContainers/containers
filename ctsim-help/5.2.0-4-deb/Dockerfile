FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctsim-help" \ 
    container="ctsim-help" \ 
    about.summary="Online help file for CTSim" \ 
    about.home="http://www.ctsim.org" \ 
    software.version="5.2.0-4-deb" \ 
    version="1" \ 
    about.copyright="1983-2010 Kevin M. Rosenberg" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/ctsim-help/copyright" \ 
    about.tags="field::biology, interface::3d, interface::graphical,:documentation, uitoolkit::wxwidgets, use::viewing,:3dmodel, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ctsim-help && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
