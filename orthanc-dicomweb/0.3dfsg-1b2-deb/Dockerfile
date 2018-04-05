FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-dicomweb" \ 
    container="orthanc-dicomweb" \ 
    about.summary="Plugin to extend Orthanc with support of WADO and DICOMweb" \ 
    about.home="http://www.orthanc-server.com/static.php?page=dicomweb" \ 
    software.version="0.3dfsg-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/orthanc-dicomweb/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y orthanc-dicomweb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
