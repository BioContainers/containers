FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="dialign-tx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="dialign-tx" \ 
    about.summary="Segment-based multiple sequence alignment" \ 
    about.home="http://dialign-tx.gobics.de/" \ 
    software.version="1.0.2-12-deb" \ 
    upstream.version="1.0.2" \ 
    version="1" \ 
    about.copyright=" 2004-2008 Amarendran R. Subramanian" \ 
    about.license="LGPL-2.1+" \ 
    about.license_file="/usr/share/doc/dialign-tx/copyright" \ 
    extra.binaries="/usr/bin/dialign-tx" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y dialign-tx || apt-get install -y dialign-tx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
