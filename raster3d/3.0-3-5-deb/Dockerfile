FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="raster3d" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="raster3d" \ 
    about.summary="tools for generating images of proteins or other molecules" \ 
    about.home="http://www.bmsc.washington.edu/raster3d/raster3d.html" \ 
    software.version="3.0-3-5-deb" \ 
    upstream.version="3.0" \ 
    version="1" \ 
    extra.identifiers.biotools="raster3d" \ 
    about.copyright="1996-2011 Ethan Merritt, David J. Bacon and Wayne F. Anderson" \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/raster3d/copyright" \ 
    extra.binaries="/usr/bin/avs2ps,/usr/bin/balls,/usr/bin/label3d,/usr/bin/normal3d,/usr/bin/rastep,/usr/bin/render,/usr/bin/ribbon,/usr/bin/rings3d,/usr/bin/rods,/usr/bin/stereo3d" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::fortran,:commandline, role::program, scope::application,:converting,:viewing, works-with-format::jpg,:png, works-with::3dmodel, works-with::image,:image:raster" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y raster3d || apt-get install -y raster3d) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
