FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spread-phy" \ 
    container="spread-phy" \ 
    about.summary="analyze and visualize phylogeographic reconstructions" \ 
    about.home="http://www.kuleuven.be/aidslab/phylogeography/SPREAD.html" \ 
    software.version="1.0.7dfsg-1-deb" \ 
    version="1" \ 
    about.copyright=" 2004-2012 Filip Bielejec <filip.bielejec@rega.kuleuven.be>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/spread-phy/copyright" \ 
    extra.binaries="/usr/bin/spread-phy" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y spread-phy && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
