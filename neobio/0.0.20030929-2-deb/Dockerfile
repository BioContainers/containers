FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="neobio" \ 
    container="neobio" \ 
    about.summary="computes alignments of amino acid and nucleotide sequences" \ 
    about.home="http://neobio.sourceforge.net/" \ 
    software.version="0.0.20030929-2-deb" \ 
    version="1" \ 
    about.copyright=" 2003 Sergio Anibal de Carvalho Junior" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/neobio/copyright" \ 
    extra.binaries="/usr/bin/neobio" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y neobio && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
