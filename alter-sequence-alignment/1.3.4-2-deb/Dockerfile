FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="alter-sequence-alignment" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="alter-sequence-alignment" \ 
    about.summary="genomic sequences ALignment Transformation EnviRonment" \ 
    about.home="http://sing.ei.uvigo.es/ALTER/" \ 
    software.version="1.3.4-2-deb" \ 
    upstream.version="1.3.4" \ 
    version="1" \ 
    about.copyright="2009-2016 David Posada <dposada@uvigo.es>," \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/alter-sequence-alignment/copyright" \ 
    extra.binaries="/usr/bin/alter-sequence-alignment" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y alter-sequence-alignment || apt-get install -y alter-sequence-alignment) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
