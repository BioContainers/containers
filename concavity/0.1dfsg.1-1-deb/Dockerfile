FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="concavity" \ 
    container="concavity" \ 
    about.summary="predictor of protein ligand binding sites from structure and conservation" \ 
    about.home="http://compbio.cs.princeton.edu/concavity/" \ 
    software.version="0.1dfsg.1-1-deb" \ 
    version="1" \ 
    about.copyright="2009 John A. Capra and Thomas Funkhouser" \ 
    about.license="GPL-3.0+" \ 
    about.license_file="/usr/share/doc/concavity/copyright" \ 
    extra.binaries="/usr/bin/concavity" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y concavity && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
