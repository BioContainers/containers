FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="imagej" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="imagej" \ 
    about.summary="Image processing program with a focus on microscopy images" \ 
    about.home="https://imagej.nih.gov/ij" \ 
    software.version="1.52j-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="imagej" \ 
    about.copyright=" 1999-2011 Wayne Rasband <wsr@nih.gov>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/imagej/copyright" \ 
    extra.binaries="/usr/bin/imagej" \ 
    about.tags="field::medicine, implemented-in::java, interface::graphical,:x11, role::program, use::analysing, use::editing,:viewing, works-with-format::gif, works-with-format::jpg,:png,:tiff, works-with::image,:image:raster, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y imagej || apt-get install -y imagej) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
