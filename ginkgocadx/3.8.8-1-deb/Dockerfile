FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ginkgocadx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ginkgocadx" \ 
    about.summary="Medical Imaging Software and complete DICOM Viewer" \ 
    about.home="http://ginkgo-cadx.com/" \ 
    software.version="3.8.8-1-deb" \ 
    upstream.version="3.8.8" \ 
    version="1" \ 
    about.copyright="2015-2016 Gert Wollny" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/ginkgocadx/copyright" \ 
    extra.binaries="/usr/bin/ginkgocadx" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::gtk, uitoolkit::wxwidgets,:viewing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ginkgocadx || apt-get install -y ginkgocadx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
