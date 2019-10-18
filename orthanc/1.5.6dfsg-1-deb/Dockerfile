FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="orthanc" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="orthanc" \ 
    about.summary="Lightweight, RESTful DICOM server for medical imaging" \ 
    about.home="http://www.orthanc-server.com/" \ 
    software.version="1.5.6dfsg-1-deb" \ 
    upstream.version="1.5.6" \ 
    version="1" \ 
    about.copyright="2012-2016 Sebastien Jodogne <s.jodogne@gmail.com>, University Hospital of Liege (Belgium), and 2017-2019 Osimis S.A. (Belgium)" \ 
    about.license="GPL-3+ with OpenSSL exception" \ 
    about.license_file="/usr/share/doc/orthanc/copyright" \ 
    extra.binaries="/usr/bin/OrthancRecoverCompressedFile" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y orthanc || apt-get install -y orthanc) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
