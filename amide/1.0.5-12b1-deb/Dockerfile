FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="amide" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="amide" \ 
    about.summary="software for Medical Imaging" \ 
    about.home="http://amide.sourceforge.net/" \ 
    software.version="1.0.5-12b1-deb" \ 
    upstream.version="1.0.5" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/amide/copyright" \ 
    about.license_file="/usr/share/doc/amide/copyright" \ 
    extra.binaries="/usr/bin/amide" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::gtk, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y amide || apt-get install -y amide) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
