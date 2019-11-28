FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="neobio" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="neobio" \ 
    about.summary="computes alignments of amino acid and nucleotide sequences" \ 
    about.home="http://neobio.sourceforge.net/" \ 
    software.version="0.0.20030929-4-deb" \ 
    upstream.version="0.0.20030929" \ 
    version="1" \ 
    extra.identifiers.biotools="neobio" \ 
    about.copyright=" 2003 Sergio Anibal de Carvalho Junior" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/neobio/copyright" \ 
    extra.binaries="/usr/bin/neobio" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y neobio || apt-get install -y neobio) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
