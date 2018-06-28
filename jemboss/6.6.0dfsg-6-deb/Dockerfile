FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="jemboss" \ 
    container="jemboss" \ 
    about.summary="graphical user interface to EMBOSS" \ 
    about.home="http://emboss.sourceforge.net" \ 
    software.version="6.6.0dfsg-6-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="emboss" \ 
    about.copyright="The EMBOSS developers or their employers." \ 
    about.license="emboss" \ 
    about.license_file="/usr/share/doc/jemboss/copyright" \ 
    extra.binaries="/usr/bin/jemboss,/usr/bin/runJemboss.sh" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y jemboss && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
