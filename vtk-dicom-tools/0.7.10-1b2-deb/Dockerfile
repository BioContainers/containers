FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="vtk-dicom-tools" \ 
    container="vtk-dicom-tools" \ 
    about.summary="DICOM for VTK - tools" \ 
    about.home="http://github.com/dgobbi/vtk-dicom/" \ 
    software.version="0.7.10-1b2-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/vtk-dicom-tools/copyright" \ 
    extra.binaries="/usr/bin/dicomdump,/usr/bin/dicomfind,/usr/bin/dicompull,/usr/bin/dicomtocsv,/usr/bin/dicomtodicom,/usr/bin/dicomtonifti,/usr/bin/niftidump,/usr/bin/niftitodicom,/usr/bin/scancodump,/usr/bin/scancotodicom" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y vtk-dicom-tools && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
