FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="murasaki" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="murasaki" \ 
    about.summary="homology detection tool across multiple large genomes" \ 
    about.home="http://murasaki.dna.bio.keio.ac.jp/wiki/" \ 
    software.version="1.68.6-8b1-deb" \ 
    upstream.version="1.68.6" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/murasaki/copyright" \ 
    about.license_file="/usr/share/doc/murasaki/copyright" \ 
    extra.binaries="/usr/bin/geneparse,/usr/bin/mbfa,/usr/bin/murasaki" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y murasaki || apt-get install -y murasaki) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
