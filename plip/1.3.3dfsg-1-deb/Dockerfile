FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plip" \ 
    container="plip" \ 
    about.summary="fully automated protein-ligand interaction profiler" \ 
    about.home="https://projects.biotec.tu-dresden.de/plip-web/plip/" \ 
    software.version="1.3.3dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="plip" \ 
    about.copyright="2016 Sebastian Salentin <sebastian.salentin@biotec.tu-dresden.de>" \ 
    about.license="Apache-2.0" \ 
    about.license_file="/usr/share/doc/plip/copyright" \ 
    extra.binaries="/usr/bin/plipcmd" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y plip && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
