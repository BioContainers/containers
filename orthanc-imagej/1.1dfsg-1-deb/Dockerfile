FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-imagej" \ 
    container="orthanc-imagej" \ 
    about.summary="ImageJ plugin to import images from Orthanc" \ 
    about.home="http://www.orthanc-server.com/static.php?page=imagej" \ 
    software.version="1.1dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2016 CHU of Liege (Belgium), and Sebastien Jodogne <s.jodogne@gmail.com>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/orthanc-imagej/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y orthanc-imagej && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
