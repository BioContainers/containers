FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtk-dicom-tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="vtk-dicom-tools" \ 
    about.summary="DICOM for VTK - tools" \ 
    about.home="http://github.com/dgobbi/vtk-dicom/" \ 
    software.version="0.8.9-1-deb" \ 
    upstream.version="0.8.9" \ 
    version="1" \ 
    about.copyright="Copyright (c) 2012-2017 David Gobbi" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/vtk-dicom-tools/copyright" \ 
    extra.binaries="/usr/bin/dicomdump,/usr/bin/dicomfind,/usr/bin/dicompull,/usr/bin/dicomtocsv,/usr/bin/dicomtodicom,/usr/bin/dicomtonifti,/usr/bin/niftidump,/usr/bin/niftitodicom,/usr/bin/scancodump,/usr/bin/scancotodicom" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y vtk-dicom-tools || apt-get install -y vtk-dicom-tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
