FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="imagevis3d" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="imagevis3d" \ 
    about.summary="desktop volume rendering application for large data" \ 
    about.home="http://www.imagevis3d.com" \ 
    software.version="3.1.0-7b2-deb" \ 
    upstream.version="3.1.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/imagevis3d/copyright" \ 
    about.license_file="/usr/share/doc/imagevis3d/copyright" \ 
    extra.binaries="/usr/bin/imagevis3d,/usr/bin/uvfconvert" \ 
    about.tags="uitoolkit::qt" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y imagevis3d || apt-get install -y imagevis3d) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
