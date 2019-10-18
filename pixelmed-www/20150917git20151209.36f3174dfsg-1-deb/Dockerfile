FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pixelmed-www" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pixelmed-www" \ 
    about.summary="DICOM implementation containing Image Viewer and a ECG Viewer - jnlp" \ 
    about.home="http://www.pixelmed.com" \ 
    software.version="20150917git20151209.36f3174dfsg-1-deb" \ 
    upstream.version="20150917" \ 
    version="1" \ 
    about.copyright="2001-2015, David A. Clunie DBA PixelMed Publishing. All rights reserved." \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/pixelmed-www/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pixelmed-www || apt-get install -y pixelmed-www) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
