FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwyddion-common" \ 
    container="gwyddion-common" \ 
    about.summary="architecture-independent files for Gwyddion SPM analysis tool" \ 
    about.home="http://gwyddion.net/" \ 
    software.version="2.47-1-deb" \ 
    version="1" \ 
    about.copyright="2003-2016 David Necas (Yeti) <yeti@gwyddion.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gwyddion-common/copyright" \ 
    about.tags="role::app-data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gwyddion-common && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
