FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rdp-classifier" \ 
    container="rdp-classifier" \ 
    about.summary="extensible sequence classifier for fungal lsu, bacterial and archaeal 16s" \ 
    about.home="https://github.com/rdpstaff/classifier" \ 
    software.version="2.10.2-1-deb" \ 
    version="1" \ 
    about.copyright="2008-2014 Michigan State University Board of Trustees <rdpstaff@msu.edu>" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/rdp-classifier/copyright" \ 
    extra.binaries="/usr/bin/rdp_classifier" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y rdp-classifier && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
