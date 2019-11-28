FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc-wsi" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc-wsi" \ 
    about.summary="Whole-slide imaging support for Orthanc (digital pathology)" \ 
    about.home="http://www.orthanc-server.com/static.php?page=wsi" \ 
    software.version="0.6-2-deb" \ 
    upstream.version="0.6" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2019 Osimis S.A. (Belgium)" \ 
    about.license="AGPL-3+" \ 
    about.license_file="/usr/share/doc/orthanc-wsi/copyright" \ 
    extra.binaries="/usr/bin/OrthancWSIDicomToTiff,/usr/bin/OrthancWSIDicomizer" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc-wsi || apt-get install -y orthanc-wsi) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
