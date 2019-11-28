FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dicomscope" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dicomscope" \ 
    about.summary="OFFIS DICOM Viewer" \ 
    about.home="http://dicom.offis.de/dscope.php.en" \ 
    software.version="3.6.0-20-deb" \ 
    upstream.version="3.6.0" \ 
    version="1" \ 
    about.copyright="(C) 1999-2009, OFFIS and Institute for MicroTherapy" \ 
    about.license="OFFIS" \ 
    about.license_file="/usr/share/doc/dicomscope/copyright" \ 
    extra.binaries="/usr/bin/dicomscope" \ 
    about.tags="field::medicine, field::medicine:imaging, role::program, use::viewing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dicomscope || apt-get install -y dicomscope) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
