FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-dev" \ 
    container="orthanc-dev" \ 
    about.summary="Orthanc development files" \ 
    about.home="http://www.orthanc-server.com/" \ 
    software.version="1.2.0dfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2015 CHU of Liege (Belgium), and Sebastien Jodogne <s.jodogne@gmail.com>" \ 
    about.license="GPL-3+ with OpenSSL exception" \ 
    about.license_file="/usr/share/doc/orthanc-dev/copyright" \ 
    about.tags="devel::library, role::devel-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y orthanc-dev && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
