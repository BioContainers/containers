FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sbmltoolbox" \ 
    container="sbmltoolbox" \ 
    about.summary="libsbml toolbox for octave and matlab" \ 
    about.home="http://sbml.org/Software/SBMLToolbox" \ 
    software.version="4.1.0-3-deb" \ 
    version="1" \ 
    about.copyright="2005-2012 Sarah M. Keating" \ 
    about.license="LGPL-2.1" \ 
    about.license_file="/usr/share/doc/sbmltoolbox/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sbmltoolbox && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
