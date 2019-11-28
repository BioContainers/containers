FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clonalframe" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="clonalframe" \ 
    about.summary="inference of bacterial microevolution using multilocus sequence data" \ 
    about.home="http://www.xavierdidelot.xtreemhost.com/clonalframe.htm" \ 
    software.version="1.2-9-deb" \ 
    upstream.version="1.2" \ 
    version="1" \ 
    about.copyright=" 2009-2010  Xavier Didelot <xavier.didelot@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/clonalframe/copyright" \ 
    extra.binaries="/usr/bin/ClonalFrame" \ 
    about.tags="implemented-in::c++, role::program" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y clonalframe || apt-get install -y clonalframe) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
