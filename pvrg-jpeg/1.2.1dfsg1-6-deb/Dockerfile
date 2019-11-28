FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pvrg-jpeg" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pvrg-jpeg" \ 
    about.summary="Stanford PVRG JPEG tool" \ 
    about.home="http://jpeg.sourceforge.net/" \ 
    software.version="1.2.1dfsg1-6-deb" \ 
    upstream.version="1.2.1" \ 
    version="1" \ 
    about.copyright="1990-2000 Andy C. Hung, all rights reserved." \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/pvrg-jpeg/copyright" \ 
    extra.binaries="/usr/bin/pvrg-jpeg" \ 
    about.tags="implemented-in::c, interface::commandline, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pvrg-jpeg || apt-get install -y pvrg-jpeg) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
