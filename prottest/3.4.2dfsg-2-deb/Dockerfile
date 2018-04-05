FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="prottest" \ 
    container="prottest" \ 
    about.summary="selection of best-fit models of protein evolution" \ 
    about.home="https://github.com/ddarriba/prottest3" \ 
    software.version="3.4.2dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="prottest" \ 
    about.copyright="2008-2015 Diego Darriba <diegodl84@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/prottest/copyright" \ 
    extra.binaries="/usr/bin/prottest" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y prottest && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
