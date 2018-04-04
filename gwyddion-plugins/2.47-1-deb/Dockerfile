FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwyddion-plugins" \ 
    container="gwyddion-plugins" \ 
    about.summary="plugins for Gwyddion SPM analysis tool" \ 
    about.home="http://gwyddion.net/" \ 
    software.version="2.47-1-deb" \ 
    version="1" \ 
    about.copyright="2003-2016 David Necas (Yeti) <yeti@gwyddion.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gwyddion-plugins/copyright" \ 
    about.tags="role::plugin" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gwyddion-plugins && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
