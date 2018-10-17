FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maude" \ 
    container="maude" \ 
    about.summary="high-performance logical framework" \ 
    about.home="http://maude.cs.uiuc.edu" \ 
    software.version="2.7-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/maude/copyright" \ 
    extra.binaries="/usr/bin/maude" \ 
    about.tags="uitoolkit::ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y maude && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
