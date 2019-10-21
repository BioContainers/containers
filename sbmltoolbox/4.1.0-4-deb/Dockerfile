FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sbmltoolbox" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sbmltoolbox" \ 
    about.summary="libsbml toolbox for octave and matlab" \ 
    about.home="http://sbml.org/Software/SBMLToolbox" \ 
    software.version="4.1.0-4-deb" \ 
    upstream.version="4.1.0" \ 
    version="1" \ 
    about.copyright="2005-2012 Sarah M. Keating" \ 
    about.license="LGPL-2.1" \ 
    about.license_file="/usr/share/doc/sbmltoolbox/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sbmltoolbox || apt-get install -y sbmltoolbox) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
