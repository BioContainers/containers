FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pdb2pqr" \ 
    container="pdb2pqr" \ 
    about.summary="Preparation of protein structures for electrostatics calculations" \ 
    about.home="http://pdb2pqr.poissonboltzmann.org/pdb2pqr/" \ 
    software.version="2.1.1dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="pdb2pqr" \ 
    about.copyright=" 2002-2010  Nathan A. Baker" \ 
    about.license="BSD3-clause" \ 
    about.license_file="/usr/share/doc/pdb2pqr/copyright" \ 
    extra.binaries="/usr/bin/pdb2pqr,/usr/bin/propka,/usr/bin/psize" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pdb2pqr && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
