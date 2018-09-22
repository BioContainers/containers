FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tifffile" \ 
    container="tifffile" \ 
    about.summary="Read and write image data from and to TIFF files" \ 
    about.home="http://www.lfd.uci.edu/~gohlke/" \ 
    software.version="20151006-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2008-2015, Christoph Gohlke," \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/tifffile/copyright" \ 
    extra.binaries="/usr/bin/tifffile" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-tifffile && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
