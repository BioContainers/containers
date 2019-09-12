FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="edfbrowser" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="edfbrowser" \ 
    about.summary="viewer for biosignal storage files such as bdf and edf" \ 
    about.home="http://www.teuniz.net/edfbrowser/" \ 
    software.version="1.67dfsg-1-deb" \ 
    upstream.version="1.67" \ 
    version="1" \ 
    about.copyright="2007 - 2013 Teunis van Beelen <teuniz@gmail.com>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/edfbrowser/copyright" \ 
    extra.binaries="/usr/bin/edfbrowser" \ 
    about.tags="field::medicine, interface::graphical, interface::x11, role::program,:qt, use::viewing, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y edfbrowser || apt-get install -y edfbrowser) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
