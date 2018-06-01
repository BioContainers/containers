FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dialign-tx" \ 
    container="dialign-tx" \ 
    about.summary="Segment-based multiple sequence alignment" \ 
    about.home="http://dialign-tx.gobics.de/" \ 
    software.version="1.0.2-9-deb" \ 
    version="1" \ 
    about.copyright=" 2004-2008 Amarendran R. Subramanian" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/dialign-tx/copyright" \ 
    extra.binaries="/usr/bin/dialign-tx" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:program, scope::utility, use::comparing, works-with-format::TODO,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y dialign-tx && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
