FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-dicomweb" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc-dicomweb" \ 
    about.summary="Plugin to extend Orthanc with support of WADO and DICOMweb" \ 
    about.home="https://www.orthanc-server.com/static.php?page=dicomweb" \ 
    software.version="0.6dfsg-1-deb" \ 
    upstream.version="0.6" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2018 Osimis S.A. (Belgium)" \ 
    about.license="AGPL-3" \ 
    about.license_file="/usr/share/doc/orthanc-dicomweb/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc-dicomweb || apt-get install -y orthanc-dicomweb) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
