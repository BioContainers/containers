FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ballview" \ 
    container="ballview" \ 
    about.summary="free molecular modeling and molecular graphics tool" \ 
    about.home="http://www.ball-project.org/" \ 
    software.version="1.4.3beta1-3-deb" \ 
    version="1" \ 
    about.copyright=" 1998-2013 the BALL project group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/ballview/copyright" \ 
    extra.binaries="/usr/bin/BALLView" \ 
    about.tags="interface::graphical, interface::x11, role::program, uitoolkit::qt,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ballview && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
