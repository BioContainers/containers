FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwyddion" \ 
    container="gwyddion" \ 
    about.summary="Scanning Probe Microscopy visualization and analysis tool" \ 
    about.home="http://gwyddion.net/" \ 
    software.version="2.47-1-deb" \ 
    version="1" \ 
    about.copyright="2003-2016 David Necas (Yeti) <yeti@gwyddion.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gwyddion/copyright" \ 
    extra.binaries="/usr/bin/gwyddion,/usr/bin/gwyddion-thumbnailer" \ 
    about.tags="field::medicine, field::physics, implemented-in::c,:graphical,:x11, role::program,:visualisation, scope::application, uitoolkit::gtk,:analysing,:viewing, works-with::image,:image:raster, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gwyddion && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
