FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fis-gtm-6.3-007" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fis-gtm-6.3-007" \ 
    about.summary="package for FIS-GT.M database" \ 
    about.home="http://sourceforge.net/projects/fis-gtm" \ 
    software.version="6.3-007-1-deb" \ 
    upstream.version="6.3" \ 
    version="1" \ 
    about.copyright="1987 - 2003 Sanchez Computer Associates" \ 
    about.license="AGPL-3.0" \ 
    about.license_file="/usr/share/doc/fis-gtm-6.3-007/copyright" \ 
    about.tags="uitoolkit::ncurses" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fis-gtm-6.3-007 || apt-get install -y fis-gtm-6.3-007) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
