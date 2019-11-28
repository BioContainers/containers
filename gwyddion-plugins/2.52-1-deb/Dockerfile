FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gwyddion-plugins" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gwyddion-plugins" \ 
    about.summary="plugins for Gwyddion SPM analysis tool" \ 
    about.home="http://gwyddion.net/" \ 
    software.version="2.52-1-deb" \ 
    upstream.version="2.52" \ 
    version="1" \ 
    about.copyright="2003-2016 David Necas (Yeti) <yeti@gwyddion.net>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gwyddion-plugins/copyright" \ 
    about.tags="role::plugin" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gwyddion-plugins || apt-get install -y gwyddion-plugins) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
