FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other-belvu" \ 
    container="acedb-other-belvu" \ 
    about.summary="multiple sequence alignment editor" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other-belvu/copyright" \ 
    extra.binaries="/usr/bin/belvu" \ 
    about.tags="role::program, uitoolkit::gtk, uitoolkit::ncurses" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y acedb-other-belvu && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
