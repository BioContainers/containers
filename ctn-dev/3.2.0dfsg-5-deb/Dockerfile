FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctn-dev" \ 
    container="ctn-dev" \ 
    about.summary="Development files for Central Test Node, a DICOM implementation" \ 
    about.home="http://sourceforge.net/projects/mirctn" \ 
    software.version="3.2.0dfsg-5-deb" \ 
    version="1" \ 
    about.copyright="1992-2008: Aniruddha S. Gokhale," \ 
    about.license="RSNA" \ 
    about.license_file="/usr/share/doc/ctn-dev/copyright" \ 
    about.tags="devel::library, field::medicine:imaging, implemented-in::c,:devel-lib, works-with::db, works-with::image,:image:raster" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ctn-dev && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
