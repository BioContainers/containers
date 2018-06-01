FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="openslide-tools" \ 
    container="openslide-tools" \ 
    about.summary="Manipulation and conversion tools for OpenSlide" \ 
    about.home="http://openslide.org" \ 
    software.version="3.4.1dfsg-2-deb" \ 
    version="1" \ 
    about.copyright=" 2007-2015 Carnegie Mellon University" \ 
    about.license="LGPL-2.1" \ 
    about.license_file="/usr/share/doc/openslide-tools/copyright" \ 
    extra.binaries="/usr/bin/openslide-quickhash1sum,/usr/bin/openslide-show-properties,/usr/bin/openslide-write-png" \ 
    about.tags="role::program, scope::utility" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y openslide-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
