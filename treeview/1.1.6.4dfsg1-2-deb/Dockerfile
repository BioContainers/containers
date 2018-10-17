FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="treeview" \ 
    container="treeview" \ 
    about.summary="Java re-implementation of Michael Eisen's TreeView" \ 
    about.home="http://jtreeview.sourceforge.net" \ 
    software.version="1.1.6.4dfsg1-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="treeview" \ 
    about.copyright="2001-2003 Alok Saldanha <alok@caltech.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/treeview/copyright" \ 
    extra.binaries="/usr/bin/treeview" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y treeview && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
