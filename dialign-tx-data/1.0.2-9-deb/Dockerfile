FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dialign-tx-data" \ 
    container="dialign-tx-data" \ 
    about.summary="Segment-based multiple sequence alignment (data files)" \ 
    about.home="http://dialign-tx.gobics.de/" \ 
    software.version="1.0.2-9-deb" \ 
    version="1" \ 
    about.copyright=" 2004-2008 Amarendran R. Subramanian" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/dialign-tx-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, made-of::TODO,:app-data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dialign-tx-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
