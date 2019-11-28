FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-webviewer" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc-webviewer" \ 
    about.summary="Web viewer of medical images for Orthanc" \ 
    about.home="https://www.orthanc-server.com/static.php?page=web-viewer" \ 
    software.version="2.5-1-deb" \ 
    upstream.version="2.5" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2018 Osimis S.A. (Belgium)" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/orthanc-webviewer/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc-webviewer || apt-get install -y orthanc-webviewer) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
