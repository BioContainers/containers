FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mira-rfam-12s-rrna" \ 
    container="mira-rfam-12s-rrna" \ 
    about.summary="extract of RFAM 12 rRNA database" \ 
    about.home="http://chevreux.org/projects_mira.html" \ 
    software.version="4.9.6-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="mira" \ 
    about.copyright=" 1997-2000 for MIRA V1.x and EdIt: Bastien Chevreux, Thomas Pfisterer, Deutsches Krebsforschungszentrum Heidelberg -- Dept. of Molecula Biophysics." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mira-rfam-12s-rrna/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mira-rfam-12s-rrna && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
