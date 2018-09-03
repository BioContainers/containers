FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="profphd-utils" \ 
    container="profphd-utils" \ 
    about.summary="profphd helper utilities convert_seq and filter_hssp" \ 
    about.home="http://www.rostlab.org/" \ 
    software.version="1.0.10-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/profphd-utils/copyright" \ 
    extra.binaries="/usr/bin/convert_seq,/usr/bin/filter_hssp" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y profphd-utils && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
