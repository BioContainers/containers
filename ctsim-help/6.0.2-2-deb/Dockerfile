FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctsim-help" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ctsim-help" \ 
    about.summary="Online help file for CTSim" \ 
    about.home="http://www.ctsim.org" \ 
    software.version="6.0.2-2-deb" \ 
    upstream.version="6.0.2" \ 
    version="1" \ 
    about.copyright="1983-2018 Kevin M. Rosenberg" \ 
    about.license="GPL" \ 
    about.license_file="/usr/share/doc/ctsim-help/copyright" \ 
    about.tags="field::biology, interface::3d, interface::graphical, interface::x11,:documentation,:program, uitoolkit::wxwidgets, use::viewing,:3dmodel, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ctsim-help || apt-get install -y ctsim-help) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
