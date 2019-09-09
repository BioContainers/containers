FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cycle" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cycle" \ 
    about.summary="calendar program for women" \ 
    about.home="http://cycle.sourceforge.net/" \ 
    software.version="0.3.1-14-deb" \ 
    upstream.version="0.3.1" \ 
    version="1" \ 
    extra.identifiers.biotools="cycle" \ 
    about.copyright="2002-2005 Oleg S. Gints <altgo@users.sourceforge.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/cycle/copyright" \ 
    extra.binaries="/usr/bin/cycle" \ 
    about.tags="field::medicine, implemented-in::python, interface::graphical,:x11, role::program, uitoolkit::wxwidgets, use::timekeeping,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cycle || apt-get install -y cycle) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
