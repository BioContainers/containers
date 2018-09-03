FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other-dotter" \ 
    container="acedb-other-dotter" \ 
    about.summary="visualisation of sequence similarity" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other-dotter/copyright" \ 
    extra.binaries="/usr/bin/dotter" \ 
    extra.identifiers.doi="10.1016/0378-1119(95)00714-8" \ 
    about.tags="role::program, uitoolkit::gtk, uitoolkit::ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y acedb-other-dotter && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
