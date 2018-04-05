FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dcm2niix" \ 
    container="dcm2niix" \ 
    about.summary="next generation DICOM to NIfTI converter" \ 
    about.home="https://github.com/rordenlab/dcm2niix" \ 
    software.version="1.0.20161101-1-deb" \ 
    version="1" \ 
    about.copyright="2014-2016 Chris Rorden" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/dcm2niix/copyright" \ 
    extra.binaries="/usr/bin/dcm2niibatch,/usr/bin/dcm2niix" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dcm2niix && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
