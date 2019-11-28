FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="andi" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="andi" \ 
    about.summary="Efficient Estimation of Evolutionary Distances" \ 
    about.home="https://github.com/EvolBioInf/andi" \ 
    software.version="0.12-4-deb" \ 
    upstream.version="0.12" \ 
    version="1" \ 
    extra.identifiers.biotools="andi" \ 
    about.copyright=" 2014-2017 Fabian Kltzl <kloetzl@evolbio.mpg.de>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/andi/copyright" \ 
    extra.binaries="/usr/bin/andi" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y andi || apt-get install -y andi) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
