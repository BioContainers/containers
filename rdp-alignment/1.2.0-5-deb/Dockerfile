FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rdp-alignment" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rdp-alignment" \ 
    about.summary="Ribosomal Database Project (RDP) alignment tools package" \ 
    about.home="https://github.com/rdpstaff/AlignmentTools" \ 
    software.version="1.2.0-5-deb" \ 
    upstream.version="1.2.0" \ 
    version="1" \ 
    about.copyright="2012-2014 Michigan State University <rdpstaff@msu.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/rdp-alignment/copyright" \ 
    extra.binaries="/usr/bin/rdp-alignment" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rdp-alignment || apt-get install -y rdp-alignment) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
