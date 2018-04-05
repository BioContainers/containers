FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="python3-dna-jellyfish" \ 
    container="python3-dna-jellyfish" \ 
    about.summary="count k-mers in DNA sequences (Python bindings of jellyfish)" \ 
    about.home="http://www.cbcb.umd.edu/software/jellyfish/" \ 
    software.version="2.2.6-1b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/python3-dna-jellyfish/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python3-dna-jellyfish && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
