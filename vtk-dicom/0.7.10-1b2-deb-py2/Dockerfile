FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtk-dicom" \ 
    container="vtk-dicom" \ 
    about.summary="DICOM for VTK - Python" \ 
    about.home="http://github.com/dgobbi/vtk-dicom/" \ 
    software.version="0.7.10-1b2-deb-py2" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/vtk-dicom/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-vtk-dicom && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
