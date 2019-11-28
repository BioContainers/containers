FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dicom3tools" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dicom3tools" \ 
    about.summary="DICOM medical image files manipulation and conversion tools" \ 
    about.home="http://www.dclunie.com/dicom3tools.html" \ 
    software.version="1.0020180803063840-1-deb" \ 
    version="1" \ 
    about.copyright="1993-2015, David A. Clunie DBA PixelMed Publishing" \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/dicom3tools/copyright" \ 
    extra.binaries="/usr/bin/andump,/usr/bin/dcdirdmp,/usr/bin/dcdump,/usr/bin/dcentvfy,/usr/bin/dcfile,/usr/bin/dchist,/usr/bin/dciodvfy,/usr/bin/dckey,/usr/bin/dcposn,/usr/bin/dcsort,/usr/bin/dcsrdump,/usr/bin/dcstats,/usr/bin/dctable,/usr/bin/dctopgm8,/usr/bin/dctopgx,/usr/bin/dctopnm,/usr/bin/dcunrgb,/usr/bin/jpegdump" \ 
    about.tags="field::medicine, field::medicine:imaging, role::program,:converting, works-with::image" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dicom3tools || apt-get install -y dicom3tools) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
