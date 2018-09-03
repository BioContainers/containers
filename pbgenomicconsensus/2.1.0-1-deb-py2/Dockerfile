FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbgenomicconsensus" \ 
    container="pbgenomicconsensus" \ 
    about.summary="Pacific Biosciences variant and consensus caller (Python 2)" \ 
    about.home="https://github.com/PacificBiosciences/GenomicConsensus" \ 
    software.version="2.1.0-1-deb-py2" \ 
    version="1" \ 
    about.copyright="2011-2015 Pacific Biosciences of California, Inc. <devnet@pacificbiosciences.com>" \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbgenomicconsensus/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-pbgenomicconsensus && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
