FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="norsnet" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="norsnet" \ 
    about.summary="tool to identify unstructured loops in proteins" \ 
    about.home="https://www.rostlab.org/owiki/index.php/Norsnet" \ 
    software.version="1.0.17-4-deb" \ 
    upstream.version="1.0.17" \ 
    version="1" \ 
    extra.identifiers.biotools="norsnet" \ 
    about.copyright="2007 Avner Schlessinger <avnersch@gmail.com>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/norsnet/copyright" \ 
    extra.binaries="/usr/bin/norsnet" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y norsnet || apt-get install -y norsnet) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
