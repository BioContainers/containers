FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="imagej" \ 
    container="imagej" \ 
    about.summary="Image processing program inspired by NIH Image" \ 
    about.home="http://imagej.nih.gov/ij" \ 
    software.version="1.51idfsg-2-deb" \ 
    version="1" \ 
    about.copyright=" 1999-2011 Wayne Rasband <wsr@nih.gov>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/imagej/copyright" \ 
    extra.binaries="/usr/bin/imagej" \ 
    about.tags="field::medicine, implemented-in::java, interface::graphical,:x11, role::program, use::analysing, use::editing,:viewing, works-with-format::gif, works-with-format::jpg,:tiff, works-with::image, works-with::image:raster,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y imagej && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
