FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mia-viewit" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="mia-viewit" \ 
    about.summary="Viewer program for 3D data sets created by using MIA" \ 
    about.home="http://mia.sourceforge.net" \ 
    software.version="1.0.5-2-deb" \ 
    upstream.version="1.0.5" \ 
    version="1" \ 
    about.copyright="Gert Wollny  <gw.fossdev@gmail.com>" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/mia-viewit/copyright" \ 
    extra.binaries="/usr/bin/mia-viewitgui" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::gtk, use::viewing,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y mia-viewit || apt-get install -y mia-viewit) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
