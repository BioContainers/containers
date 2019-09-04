FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aeskulap" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="aeskulap" \ 
    about.summary="medical image viewer and DICOM network client" \ 
    about.home="http://aeskulap.nongnu.org" \ 
    software.version="0.2.2-beta2git20180219.8787e95-2-deb" \ 
    upstream.version="0.2.2" \ 
    version="1" \ 
    about.copyright="2005-2007 Alexander Pipelka <pipelka@teleweb.at>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/aeskulap/copyright" \ 
    extra.binaries="/usr/bin/aeskulap" \ 
    about.tags="field::biology, field::medicine, field::medicine:imaging,:c++, interface::graphical, interface::x11,:client, role::program, scope::application, uitoolkit::gtk,:viewing, works-with::image, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y aeskulap || apt-get install -y aeskulap) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
