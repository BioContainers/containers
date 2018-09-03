FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="disulfinder" \ 
    container="disulfinder" \ 
    about.summary="cysteines disulfide bonding state and connectivity predictor" \ 
    about.home="http://disulfind.dsi.unifi.it/" \ 
    software.version="1.2.11-6-deb" \ 
    version="1" \ 
    about.copyright=" 2011 Alessio Ceroni," \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/disulfinder/copyright" \ 
    extra.binaries="/usr/bin/disulfinder" \ 
    about.tags="role::program" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y disulfinder && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
