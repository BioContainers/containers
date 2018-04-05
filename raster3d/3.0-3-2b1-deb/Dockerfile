FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="raster3d" \ 
    container="raster3d" \ 
    about.summary="tools for generating images of proteins or other molecules" \ 
    about.home="http://www.bmsc.washington.edu/raster3d/raster3d.html" \ 
    software.version="3.0-3-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/raster3d/copyright" \ 
    extra.binaries="/usr/bin/avs2ps,/usr/bin/balls,/usr/bin/label3d,/usr/bin/normal3d,/usr/bin/rastep,/usr/bin/render,/usr/bin/ribbon,/usr/bin/rings3d,/usr/bin/rods,/usr/bin/stereo3d" \ 
    about.tags="field::biology, field::biology:structural, implemented-in::fortran,:commandline, role::program, scope::application,:converting,:viewing, works-with-format::jpg,:png, works-with::3dmodel, works-with::image,:image:raster" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y raster3d && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
