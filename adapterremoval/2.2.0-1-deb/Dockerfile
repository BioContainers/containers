FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="adapterremoval" \ 
    container="adapterremoval" \ 
    about.summary="rapid adapter trimming, identification, and read merging of gene sequences" \ 
    about.home="https://github.com/MikkelSchubert/adapterremoval" \ 
    software.version="2.2.0-1-deb" \ 
    version="1" \ 
    about.copyright="2012-2016 Mikkel Schubert, Stinus Lindgreen and Ludovic Orlando" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/adapterremoval/copyright" \ 
    extra.binaries="/usr/bin/AdapterRemoval" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y adapterremoval && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
