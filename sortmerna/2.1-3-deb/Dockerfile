FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sortmerna" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sortmerna" \ 
    about.summary="tool for filtering, mapping and OTU-picking NGS reads" \ 
    about.home="http://bioinfo.lifl.fr/RNA/sortmerna/" \ 
    software.version="2.1-3-deb" \ 
    upstream.version="2.1" \ 
    version="1" \ 
    extra.identifiers.biotools="sortmerna" \ 
    about.copyright="2012-2014 Bonsai Bioinformatics Research Group, LIFL and" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/sortmerna/copyright" \ 
    extra.binaries="/usr/bin/indexdb_rna,/usr/bin/sortmerna" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sortmerna || apt-get install -y sortmerna) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
