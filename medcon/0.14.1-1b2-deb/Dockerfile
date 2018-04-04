FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="medcon" \ 
    container="medcon" \ 
    about.summary="Medical Image (DICOM, ECAT, ...) conversion tool" \ 
    about.home="http://xmedcon.sourceforge.net/" \ 
    software.version="0.14.1-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/medcon/copyright" \ 
    extra.binaries="/usr/bin/medcon" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:graphical, role::program, uitoolkit::gtk, use::converting,:image,:image:raster, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y medcon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
