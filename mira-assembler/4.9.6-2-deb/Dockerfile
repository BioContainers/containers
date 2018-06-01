FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="mira-assembler" \ 
    container="mira-assembler" \ 
    about.summary="Whole Genome Shotgun and EST Sequence Assembler" \ 
    about.home="http://chevreux.org/projects_mira.html" \ 
    software.version="4.9.6-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="mira" \ 
    about.copyright=" 1997-2000 for MIRA V1.x and EdIt: Bastien Chevreux, Thomas Pfisterer, Deutsches Krebsforschungszentrum Heidelberg -- Dept. of Molecula Biophysics." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/mira-assembler/copyright" \ 
    extra.binaries="/usr/bin/mira,/usr/bin/mirabait,/usr/bin/miraconvert,/usr/bin/miramem,/usr/bin/miramer" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y mira-assembler && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
