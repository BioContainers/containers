FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dicomscope" \ 
    container="dicomscope" \ 
    about.summary="OFFIS DICOM Viewer" \ 
    about.home="http://dicom.offis.de/dscope.php.en" \ 
    software.version="3.6.0-15-deb" \ 
    version="1" \ 
    about.copyright="(C) 1999-2009, OFFIS and Institute for MicroTherapy" \ 
    about.license="OFFIS" \ 
    about.license_file="/usr/share/doc/dicomscope/copyright" \ 
    extra.binaries="/usr/bin/dicomscope" \ 
    about.tags="field::medicine, field::medicine:imaging, role::program, use::viewing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dicomscope && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
