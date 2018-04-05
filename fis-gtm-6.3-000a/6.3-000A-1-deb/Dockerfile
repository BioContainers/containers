FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fis-gtm-6.3-000a" \ 
    container="fis-gtm-6.3-000a" \ 
    about.summary="package for FIS-GT.M database" \ 
    about.home="http://sourceforge.net/projects/fis-gtm" \ 
    software.version="6.3-000A-1-deb" \ 
    version="1" \ 
    about.copyright="1987 - 2003 Sanchez Computer Associates" \ 
    about.license="AGPL-3.0" \ 
    about.license_file="/usr/share/doc/fis-gtm-6.3-000a/copyright" \ 
    about.tags="uitoolkit::ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fis-gtm-6.3-000a && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
