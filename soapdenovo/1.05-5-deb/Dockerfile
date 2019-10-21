FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="soapdenovo" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="soapdenovo" \ 
    about.summary="short-read assembly method to build de novo draft assembly" \ 
    about.home="http://soap.genomics.org.cn/soapdenovo.html" \ 
    software.version="1.05-5-deb" \ 
    upstream.version="1.05" \ 
    version="1" \ 
    extra.identifiers.biotools="soapdenovo" \ 
    about.copyright="2008-2010 BGI-Shenzhen" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/soapdenovo/copyright" \ 
    extra.binaries="/usr/bin/soapdenovo-127mer,/usr/bin/soapdenovo-31mer,/usr/bin/soapdenovo-63mer" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y soapdenovo || apt-get install -y soapdenovo) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
