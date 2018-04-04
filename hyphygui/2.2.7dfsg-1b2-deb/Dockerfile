FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hyphygui" \ 
    container="hyphygui" \ 
    about.summary="Hypothesis testing using Phylogenies (GTK+ gui)" \ 
    about.home="http://hyphy.org/" \ 
    software.version="2.2.7dfsg-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/hyphygui/copyright" \ 
    extra.binaries="/usr/bin/hyphygtk" \ 
    about.tags="uitoolkit::gtk" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hyphygui && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
