FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="medcon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="medcon" \ 
    about.summary="Medical Image (DICOM, ECAT, ...) conversion tool" \ 
    about.home="http://xmedcon.sourceforge.net/" \ 
    software.version="0.16.1dfsg-1-deb" \ 
    upstream.version="0.16.1" \ 
    version="1" \ 
    about.copyright=" 1997-2013 Erik Nolf <enlf@users.sourceforge.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/medcon/copyright" \ 
    extra.binaries="/usr/bin/medcon" \ 
    about.tags="field::biology, implemented-in::c, interface::commandline,:graphical,:x11, role::program, uitoolkit::gtk,:converting, works-with::image, works-with::image:raster,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y medcon || apt-get install -y medcon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
