FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwyddion" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gwyddion" \ 
    about.summary="Scanning Probe Microscopy visualization and analysis tool" \ 
    about.home="http://gwyddion.net/" \ 
    software.version="2.52-1-deb" \ 
    upstream.version="2.52" \ 
    version="1" \ 
    about.copyright="2003-2016 David Necas (Yeti) <yeti@gwyddion.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gwyddion/copyright" \ 
    extra.binaries="/usr/bin/gwyddion,/usr/bin/gwyddion-thumbnailer" \ 
    about.tags="field::medicine, field::physics, implemented-in::c,:graphical,:x11, role::program,:visualisation, scope::application, uitoolkit::gtk,:analysing,:viewing, works-with::image,:image:raster, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gwyddion || apt-get install -y gwyddion) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
