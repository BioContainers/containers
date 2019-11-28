FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="spread-phy" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="spread-phy" \ 
    about.summary="analyze and visualize phylogeographic reconstructions" \ 
    about.home="http://www.kuleuven.be/aidslab/phylogeography/SPREAD.html" \ 
    software.version="1.0.7dfsg-2-deb" \ 
    upstream.version="1.0.7" \ 
    version="1" \ 
    about.copyright=" 2004-2012 Filip Bielejec <filip.bielejec@rega.kuleuven.be>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/spread-phy/copyright" \ 
    extra.binaries="/usr/bin/spread-phy" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y spread-phy || apt-get install -y spread-phy) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
