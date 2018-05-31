FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="andi" \ 
    container="andi" \ 
    about.summary="Efficient Estimation of Evolutionary Distances" \ 
    about.home="https://github.com/EvolBioInf/andi" \ 
    software.version="0.10-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="andi" \ 
    about.copyright=" 2014-2015 Fabian Kltzl <kloetzl@evolbio.mpg.de>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/andi/copyright" \ 
    extra.binaries="/usr/bin/andi" \ 
    extra.identifiers.conda="andi" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y andi && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
