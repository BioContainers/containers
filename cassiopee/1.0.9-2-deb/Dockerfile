FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="cassiopee" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="cassiopee" \ 
    about.summary="index and search tool in genomic sequences" \ 
    about.home="https://github.com/osallou/cassiopee-c" \ 
    software.version="1.0.9-2-deb" \ 
    upstream.version="1.0.9" \ 
    version="1" \ 
    about.copyright="2013 IRISA, Olivier Sallou <osallou@irisa.fr>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/cassiopee/copyright" \ 
    extra.binaries="/usr/bin/cassiopee,/usr/bin/cassiopeeknife" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y cassiopee || apt-get install -y cassiopee) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
