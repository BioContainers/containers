FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtk-dicom" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="vtk-dicom" \ 
    about.summary="DICOM for VTK - Python" \ 
    about.home="http://github.com/dgobbi/vtk-dicom/" \ 
    software.version="0.8.9-1-deb-py3" \ 
    upstream.version="0.8.9" \ 
    version="1" \ 
    about.copyright="Copyright (c) 2012-2017 David Gobbi" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/vtk-dicom/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-vtk-dicom || apt-get install -y python3-vtk-dicom) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
