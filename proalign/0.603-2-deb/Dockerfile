FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proalign" \ 
    container="proalign" \ 
    about.summary="Probabilistic multiple alignment program" \ 
    about.home="http://ueg.ulb.ac.be/ProAlign/" \ 
    software.version="0.603-2-deb" \ 
    version="1" \ 
    about.copyright=" 2002-2003 Ari Lytynoja and Michel C. Milinkovitch." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/proalign/copyright" \ 
    extra.binaries="/usr/bin/proalign" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y proalign && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
