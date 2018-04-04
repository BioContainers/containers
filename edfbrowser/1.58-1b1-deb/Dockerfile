FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edfbrowser" \ 
    container="edfbrowser" \ 
    about.summary="viewer for biosignal storage files such as bdf and edf" \ 
    about.home="http://www.teuniz.net/edfbrowser/" \ 
    software.version="1.58-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/edfbrowser/copyright" \ 
    extra.binaries="/usr/bin/edfbrowser" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::viewing, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y edfbrowser && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
