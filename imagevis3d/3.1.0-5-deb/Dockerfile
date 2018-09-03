FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="imagevis3d" \ 
    container="imagevis3d" \ 
    about.summary="desktop volume rendering application for large data" \ 
    about.home="http://www.imagevis3d.com" \ 
    software.version="3.1.0-5-deb" \ 
    version="1" \ 
    about.copyright=" 2008-2011 Scientific Computing and Imaging Institute" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/imagevis3d/copyright" \ 
    extra.binaries="/usr/bin/imagevis3d,/usr/bin/uvfconvert" \ 
    about.tags="uitoolkit::qt" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y imagevis3d && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
