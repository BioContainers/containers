FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="kmer" \ 
    container="kmer" \ 
    about.summary="suite of tools for DNA sequence analysis" \ 
    about.home="http://kmer.sourceforge.net" \ 
    software.version="020150903r2013-3-deb" \ 
    version="1" \ 
    about.copyright=" 2002 PE Corporation (NY) through the Celera Genomics Group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/kmer/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y kmer && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
