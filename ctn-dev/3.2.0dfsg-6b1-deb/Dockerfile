FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ctn-dev" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ctn-dev" \ 
    about.summary="Development files for Central Test Node, a DICOM implementation" \ 
    about.home="http://sourceforge.net/projects/mirctn" \ 
    software.version="3.2.0dfsg-6b1-deb" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/ctn-dev/copyright" \ 
    about.license_file="/usr/share/doc/ctn-dev/copyright" \ 
    about.tags="devel::library, field::medicine:imaging, implemented-in::c,:devel-lib,:program, works-with::db, works-with::image,:image:raster" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ctn-dev || apt-get install -y ctn-dev) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
