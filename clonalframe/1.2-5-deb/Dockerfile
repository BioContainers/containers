FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clonalframe" \ 
    container="clonalframe" \ 
    about.summary="inference of bacterial microevolution using multilocus sequence data" \ 
    about.home="http://www.xavierdidelot.xtreemhost.com/clonalframe.htm" \ 
    software.version="1.2-5-deb" \ 
    version="1" \ 
    about.copyright=" 2009-2010  Xavier Didelot <xavier.didelot@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/clonalframe/copyright" \ 
    extra.binaries="/usr/bin/ClonalFrame" \ 
    about.tags="implemented-in::c++, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clonalframe && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
