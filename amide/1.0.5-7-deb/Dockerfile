FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="amide" \ 
    container="amide" \ 
    about.summary="software for Medical Imaging" \ 
    about.home="http://amide.sourceforge.net/" \ 
    software.version="1.0.5-7-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/amide/copyright" \ 
    extra.binaries="/usr/bin/amide" \ 
    about.tags="field::medicine, field::medicine:imaging, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y amide && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
