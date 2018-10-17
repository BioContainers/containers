FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bamtools" \ 
    container="bamtools" \ 
    about.summary="toolkit for manipulating BAM (genome alignment) files" \ 
    about.home="https://github.com/pezmaster31/bamtools/wiki" \ 
    software.version="2.4.1dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="bamtools" \ 
    about.copyright="2009-2012 Derek Barnett <derekwbarnett@gmail.com>" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/bamtools/copyright" \ 
    extra.binaries="/usr/bin/bamtools" \ 
    about.tags="implemented-in::c++, role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y bamtools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
