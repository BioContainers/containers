FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-postgresql" \ 
    container="orthanc-postgresql" \ 
    about.summary="Plugins to use PostgreSQL as a database back-end to Orthanc" \ 
    about.home="http://www.orthanc-server.com/static.php?page=postgresql" \ 
    software.version="2.0-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/orthanc-postgresql/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y orthanc-postgresql && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
