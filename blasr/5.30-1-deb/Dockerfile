FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="blasr" \ 
    container="blasr" \ 
    about.summary="mapping single-molecule sequencing reads" \ 
    about.home="https://github.com/PacificBiosciences/blasr" \ 
    software.version="5.30-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="blasr" \ 
    about.copyright="2011-2016 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/blasr/copyright" \ 
    extra.binaries="/usr/bin/bam2bax,/usr/bin/bam2plx,/usr/bin/bax2bam,/usr/bin/blasr,/usr/bin/loadPulses,/usr/bin/pls2fasta,/usr/bin/samFilter,/usr/bin/samtoh5,/usr/bin/samtom4,/usr/bin/sawriter,/usr/bin/sdpMatcher,/usr/bin/toAfg" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y blasr && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
