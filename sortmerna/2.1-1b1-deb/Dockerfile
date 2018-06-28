FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sortmerna" \ 
    container="sortmerna" \ 
    about.summary="tool for filtering, mapping and OTU-picking NGS reads" \ 
    about.home="http://bioinfo.lifl.fr/RNA/sortmerna/" \ 
    software.version="2.1-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sortmerna/copyright" \ 
    extra.binaries="/usr/bin/indexdb_rna,/usr/bin/sortmerna" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sortmerna && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
