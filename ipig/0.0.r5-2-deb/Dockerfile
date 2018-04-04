FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ipig" \ 
    container="ipig" \ 
    about.summary="integrating PSMs into genome browser visualisations" \ 
    about.home="http://sourceforge.net/projects/ipig/" \ 
    software.version="0.0.r5-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="ipig" \ 
    about.copyright="2012-2013 Mathias Kuhring <KuhringM@rki.de>" \ 
    about.license="BSDlike" \ 
    about.license_file="/usr/share/doc/ipig/copyright" \ 
    extra.binaries="/usr/bin/ipig" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ipig && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
