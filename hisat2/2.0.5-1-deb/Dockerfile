FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="hisat2" \ 
    container="hisat2" \ 
    about.summary="graph-based alignment of short nucleotide reads to many genomes" \ 
    about.home="https://ccb.jhu.edu/software/hisat2/index.shtml" \ 
    software.version="2.0.5-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="hisat2" \ 
    about.copyright=" 2011-2012, Ben Langmead <langmea@cs.jhu.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/hisat2/copyright" \ 
    extra.binaries="/usr/bin/hisat2,/usr/bin/hisat2-align-l,/usr/bin/hisat2-align-s,/usr/bin/hisat2-build,/usr/bin/hisat2-build-l,/usr/bin/hisat2-build-s,/usr/bin/hisat2-inspect,/usr/bin/hisat2-inspect-l,/usr/bin/hisat2-inspect-s" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y hisat2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
