FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fml-asm" \ 
    container="fml-asm" \ 
    about.summary="tool for assembling Illumina short reads in small regions" \ 
    about.home="https://github.com/lh3/fermi-lite" \ 
    software.version="0.1-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/fml-asm/copyright" \ 
    extra.binaries="/usr/bin/fml-asm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fml-asm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
