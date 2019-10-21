FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="xmedcon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="xmedcon" \ 
    about.summary="Medical Image (DICOM, ECAT, ...) conversion tool (GUI)" \ 
    about.home="http://xmedcon.sourceforge.net/" \ 
    software.version="0.16.1dfsg-1-deb" \ 
    upstream.version="0.16.1" \ 
    version="1" \ 
    about.copyright=" 1997-2013 Erik Nolf <enlf@users.sourceforge.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/xmedcon/copyright" \ 
    extra.binaries="/usr/bin/xmedcon" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:graphical,:x11, role::program, scope::utility,:gtk, use::converting, works-with::image,:image:raster, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y xmedcon || apt-get install -y xmedcon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
