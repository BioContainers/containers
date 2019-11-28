FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtkgdcm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="vtkgdcm" \ 
    about.summary="Grassroots DICOM VTK/Python bindings" \ 
    about.home="http://gdcm.sourceforge.net/" \ 
    software.version="2.8.8-9-deb-py3" \ 
    upstream.version="2.8.8" \ 
    version="1" \ 
    about.copyright="2006-2011 Mathieu Malaterre" \ 
    about.license="BSD-3-clause-alike-CREATIS" \ 
    about.license_file="/usr/share/doc/vtkgdcm/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-vtkgdcm || apt-get install -y python3-vtkgdcm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
