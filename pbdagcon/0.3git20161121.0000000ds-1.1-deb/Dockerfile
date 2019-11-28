FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbdagcon" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pbdagcon" \ 
    about.summary="sequence consensus using directed acyclic graphs" \ 
    about.home="https://github.com/PacificBiosciences/pbdagcon" \ 
    software.version="0.3git20161121.0000000ds-1.1-deb" \ 
    upstream.version="0.3" \ 
    version="1" \ 
    about.copyright="2011-2015 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbdagcon/copyright" \ 
    extra.binaries="/usr/bin/dazcon,/usr/bin/pbdagcon" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pbdagcon || apt-get install -y pbdagcon) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
