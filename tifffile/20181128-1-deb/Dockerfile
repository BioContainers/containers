FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tifffile" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tifffile" \ 
    about.summary="Read and write image data from and to TIFF files" \ 
    about.home="http://www.lfd.uci.edu/~gohlke/" \ 
    software.version="20181128-1-deb" \ 
    upstream.version="20181128" \ 
    version="1" \ 
    about.copyright="2008-2015, Christoph Gohlke," \ 
    about.license="BSD-3-clause" \ 
    about.license_file="/usr/share/doc/tifffile/copyright" \ 
    extra.binaries="/usr/bin/lsm2bin,/usr/bin/tifffile" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tifffile || apt-get install -y tifffile) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
