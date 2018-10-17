FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbbarcode" \ 
    container="pbbarcode" \ 
    about.summary="annotate PacBio sequencing reads with barcode information" \ 
    about.home="https://github.com/PacificBiosciences/pbbarcode" \ 
    software.version="0.8.0-4-deb" \ 
    version="1" \ 
    about.copyright="2011-2012 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbbarcode/copyright" \ 
    extra.binaries="/usr/bin/pbbarcode" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbbarcode && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
