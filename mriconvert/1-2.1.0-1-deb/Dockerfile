FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mriconvert" \ 
    container="mriconvert" \ 
    about.summary="medical image file conversion utility" \ 
    about.home="http://lcni.uoregon.edu/~jolinda/MRIConvert/" \ 
    software.version="1-2.1.0-1-deb" \ 
    version="1" \ 
    about.copyright="2010-2016 Jolinda Smith <jolinda@uoregon.edu>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/mriconvert/copyright" \ 
    extra.binaries="/usr/bin/MRIConvert,/usr/bin/mcverter" \ 
    about.tags="field::medicine, field::medicine:imaging, interface::graphical,:x11, role::program, uitoolkit::wxwidgets, use::converting,:application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mriconvert && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
