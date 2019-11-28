FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="atac" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="atac" \ 
    about.summary="genome assembly-to-assembly comparison" \ 
    about.home="http://kmer.sourceforge.net" \ 
    software.version="020150903r2013-6-deb" \ 
    version="1" \ 
    about.copyright=" 2002 PE Corporation (NY) through the Celera Genomics Group" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/atac/copyright" \ 
    extra.binaries="/usr/bin/atac" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y atac || apt-get install -y atac) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
