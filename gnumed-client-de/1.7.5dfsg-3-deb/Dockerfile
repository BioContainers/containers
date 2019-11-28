FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gnumed-client-de" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gnumed-client-de" \ 
    about.summary="medical practice management - Client for German users" \ 
    about.home="http://www.gnumed.de" \ 
    software.version="1.7.5dfsg-3-deb" \ 
    upstream.version="1.7.5" \ 
    version="1" \ 
    about.copyright=" 2000-2005 Horst Herb, a.o." \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gnumed-client-de/copyright" \ 
    about.tags="culture::german, field::medicine, role::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gnumed-client-de || apt-get install -y gnumed-client-de) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
