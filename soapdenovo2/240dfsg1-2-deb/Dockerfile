FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="soapdenovo2" \ 
    container="soapdenovo2" \ 
    about.summary="short-read assembly method to build de novo draft assembly" \ 
    about.home="http://soap.genomics.org.cn/soapdenovo.html" \ 
    software.version="240dfsg1-2-deb" \ 
    version="1" \ 
    about.copyright="2008-2012 BGI-Shenzhen" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/soapdenovo2/copyright" \ 
    extra.binaries="/usr/bin/soapdenovo2-127mer,/usr/bin/soapdenovo2-63mer" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y soapdenovo2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
