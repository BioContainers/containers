FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pixelmed-www" \ 
    container="pixelmed-www" \ 
    about.summary="DICOM implementation containing Image Viewer and a ECG Viewer - jnlp" \ 
    about.home="http://www.pixelmed.com" \ 
    software.version="20150917-1-deb" \ 
    version="1" \ 
    about.copyright="2001-2008, David A. Clunie DBA PixelMed Publishing. All rights reserved." \ 
    about.license="BSD" \ 
    about.license_file="/usr/share/doc/pixelmed-www/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pixelmed-www && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
