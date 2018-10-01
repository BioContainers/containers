FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="elastix" \ 
    container="elastix" \ 
    base_image="biocontainers/biocontainers:debian-stretch-backports" \
    about.summary="toolbox for rigid and nonrigid registration of images" \ 
    about.home="http://elastix.isi.uu.nl/" \ 
    software.version="4.8-10b1-deb" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/elastix/copyright" \
    about.license_file="/usr/share/doc/elastix/copyright" \ 
    extra.binaries="/usr/bin/elastix,/usr/bin/transformix" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y elastix && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
