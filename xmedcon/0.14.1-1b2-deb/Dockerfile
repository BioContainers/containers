FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="xmedcon" \ 
    container="xmedcon" \ 
    about.summary="Medical Image (DICOM, ECAT, ...) conversion tool (GUI)" \ 
    about.home="http://xmedcon.sourceforge.net/" \ 
    software.version="0.14.1-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/xmedcon/copyright" \ 
    extra.binaries="/usr/bin/xmedcon" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:graphical,:x11, role::program, scope::utility,:gtk, use::converting, works-with::image,:image:raster, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y xmedcon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
