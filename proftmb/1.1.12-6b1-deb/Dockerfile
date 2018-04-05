FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proftmb" \ 
    container="proftmb" \ 
    about.summary="per-residue prediction of bacterial transmembrane beta barrels" \ 
    about.home="http://rostlab.org/" \ 
    software.version="1.1.12-6b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/proftmb/copyright" \ 
    extra.binaries="/usr/bin/proftmb" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y proftmb && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
