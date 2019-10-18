FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="plip" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="plip" \ 
    about.summary="fully automated protein-ligand interaction profiler" \ 
    about.home="https://projects.biotec.tu-dresden.de/plip-web/plip/" \ 
    software.version="1.4.3bdfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="plip" \ 
    about.copyright="2016 Sebastian Salentin <sebastian.salentin@biotec.tu-dresden.de>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/plip/copyright" \ 
    extra.binaries="/usr/bin/plipcmd" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y plip || apt-get install -y plip) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
