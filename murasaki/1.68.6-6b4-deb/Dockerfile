FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="murasaki" \ 
    container="murasaki" \ 
    about.summary="homology detection tool across multiple large genomes" \ 
    about.home="http://murasaki.dna.bio.keio.ac.jp/wiki/" \ 
    software.version="1.68.6-6b4-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/murasaki/copyright" \ 
    extra.binaries="/usr/bin/geneparse,/usr/bin/mbfa,/usr/bin/murasaki" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y murasaki && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
