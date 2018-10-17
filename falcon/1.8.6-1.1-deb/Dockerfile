FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="falcon" \ 
    container="falcon" \ 
    about.summary="diploid-aware genome assembly of single-molecule sequencing reads" \ 
    about.home="https://github.com/PacificBiosciences/FALCON" \ 
    software.version="1.8.6-1.1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="falcon" \ 
    about.copyright="2011-2016 Pacific Biosciences of California, Inc." \ 
    about.license="BSD-3-Clause-PacBio" \ 
    about.license_file="/usr/share/doc/falcon/copyright" \ 
    extra.binaries="/usr/bin/fc_run,/usr/bin/fc_run.py" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y falcon && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
