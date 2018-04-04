FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-webviewer" \ 
    container="orthanc-webviewer" \ 
    about.summary="Web viewer of medical images for Orthanc" \ 
    about.home="http://www.orthanc-server.com/static.php?page=web-viewer" \ 
    software.version="2.2-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/orthanc-webviewer/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y orthanc-webviewer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
