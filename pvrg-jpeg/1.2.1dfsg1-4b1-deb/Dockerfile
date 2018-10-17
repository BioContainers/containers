FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pvrg-jpeg" \ 
    container="pvrg-jpeg" \ 
    about.summary="Stanford PVRG JPEG tool" \ 
    about.home="http://jpeg.sourceforge.net/" \ 
    software.version="1.2.1dfsg1-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/pvrg-jpeg/copyright" \ 
    extra.binaries="/usr/bin/pvrg-jpeg" \ 
    about.tags="implemented-in::c, interface::commandline, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pvrg-jpeg && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
