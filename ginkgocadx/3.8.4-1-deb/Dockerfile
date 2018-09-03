FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ginkgocadx" \ 
    container="ginkgocadx" \ 
    about.summary="Medical Imaging Software and complete DICOM Viewer" \ 
    about.home="http://ginkgo-cadx.com/" \ 
    software.version="3.8.4-1-deb" \ 
    version="1" \ 
    about.copyright="2015-2016 Gert Wollny" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/ginkgocadx/copyright" \ 
    extra.binaries="/usr/bin/ginkgocadx" \ 
    about.tags="field::medicine, field::medicine:imaging, role::program, uitoolkit::gtk,:wxwidgets, use::viewing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ginkgocadx && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
