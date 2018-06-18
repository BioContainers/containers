FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtkgdcm" \ 
    container="vtkgdcm" \ 
    about.summary="Grassroots DICOM VTK/Python bindings" \ 
    about.home="http://gdcm.sourceforge.net/" \ 
    software.version="2.6.6-3-deb-py2" \ 
    version="1" \ 
    about.copyright="2006-2011 Mathieu Malaterre" \ 
    about.license="BSD-3-clause-alike-CREATIS" \ 
    about.license_file="/usr/share/doc/vtkgdcm/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-vtkgdcm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
