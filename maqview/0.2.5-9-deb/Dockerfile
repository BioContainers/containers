FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maqview" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="maqview" \ 
    about.summary="graphical read alignment viewer for short gene sequences" \ 
    about.home="http://maq.sourceforge.net/maqview.shtml" \ 
    software.version="0.2.5-9-deb" \ 
    upstream.version="0.2.5" \ 
    version="1" \ 
    extra.identifiers.biotools="maqview" \ 
    about.copyright="2007-2008, Jue Ruan <ruanjue@genomics.org.cn>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/maqview/copyright" \ 
    extra.binaries="/usr/bin/maqindex,/usr/bin/maqindex_socks,/usr/bin/maqview,/usr/bin/zrio" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y maqview || apt-get install -y maqview) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
