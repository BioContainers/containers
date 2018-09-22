FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbdagcon" \ 
    container="pbdagcon" \ 
    about.summary="sequence consensus using directed acyclic graphs" \ 
    about.home="https://github.com/PacificBiosciences/pbdagcon" \ 
    software.version="0.320161121ds-1-deb" \ 
    version="1" \ 
    about.copyright="2011-2015 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbdagcon/copyright" \ 
    extra.binaries="/usr/bin/dazcon,/usr/bin/pbdagcon" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbdagcon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
