FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pdb2pqr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pdb2pqr" \ 
    about.summary="Preparation of protein structures for electrostatics calculations" \ 
    about.home="https://www.cgl.ucsf.edu/chimera/docs/ContributedSoftware/apbs/pdb2pqr.html" \ 
    software.version="2.1.1dfsg-5-deb" \ 
    upstream.version="2.1.1" \ 
    version="1" \ 
    extra.identifiers.biotools="pdb2pqr" \ 
    about.copyright=" 2002-2010  Nathan A. Baker" \ 
    about.license="BSD3-clause" \ 
    about.license_file="/usr/share/doc/pdb2pqr/copyright" \ 
    extra.binaries="/usr/bin/pdb2pqr,/usr/bin/propka,/usr/bin/psize" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pdb2pqr || apt-get install -y pdb2pqr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
