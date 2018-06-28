FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cgview" \ 
    container="cgview" \ 
    about.summary="Circular Genome Viewer" \ 
    about.home="http://wishart.biology.ualberta.ca/cgview/" \ 
    software.version="0.0.20100111-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="cgview" \ 
    about.copyright="2004-2010 Paul Stothard" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/cgview/copyright" \ 
    extra.binaries="/usr/bin/cgview" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cgview && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
