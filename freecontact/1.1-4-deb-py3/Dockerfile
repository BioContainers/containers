FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="freecontact" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="freecontact" \ 
    about.summary="fast protein contact predictor - binding for Python3" \ 
    about.home="https://rostlab.org/owiki/index.php/FreeContact" \ 
    software.version="1.1-4-deb-py3" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.copyright="2013 Laszlo Kajan <lkajan@rostlab.org>, Technical University of Munich, Germany" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/freecontact/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-freecontact || apt-get install -y python3-freecontact) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
