FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="maqview" \ 
    container="maqview" \ 
    about.summary="graphical read alignment viewer for short gene sequences" \ 
    about.home="http://maq.sourceforge.net/maqview.shtml" \ 
    software.version="0.2.5-7b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/maqview/copyright" \ 
    extra.binaries="/usr/bin/maqindex,/usr/bin/maqindex_socks,/usr/bin/maqview,/usr/bin/zrio" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y maqview && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
