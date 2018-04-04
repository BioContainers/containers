FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cdbfasta" \ 
    container="cdbfasta" \ 
    about.summary="Constant DataBase indexing and retrieval tools for multi-FASTA files" \ 
    about.home="http://cdbfasta.sourceforge.net/" \ 
    software.version="0.99-20100722-3-deb" \ 
    version="1" \ 
    about.copyright=" 2002-2010 Geo Pertea <geo.pertea@gmail.com>," \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/cdbfasta/copyright" \ 
    extra.binaries="/usr/bin/cdbfasta,/usr/bin/cdbyank" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y cdbfasta && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
