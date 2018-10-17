FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pbalign" \ 
    container="pbalign" \ 
    about.summary="map Pacific Biosciences reads to reference DNA sequences" \ 
    about.home="https://github.com/PacificBiosciences/pbalign" \ 
    software.version="0.3.0-1-deb" \ 
    version="1" \ 
    about.copyright="2011-2014 Pacific Biosciences of California, Inc." \ 
    about.license="PacBio-BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/pbalign/copyright" \ 
    extra.binaries="/usr/bin/createChemistryHeader,/usr/bin/createChemistryHeader.py,/usr/bin/extractUnmappedSubreads,/usr/bin/extractUnmappedSubreads.py,/usr/bin/loadChemistry,/usr/bin/loadChemistry.py,/usr/bin/maskAlignedReads,/usr/bin/maskAlignedReads.py,/usr/bin/pbalign" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pbalign && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
