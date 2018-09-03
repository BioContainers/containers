FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="trimmomatic" \ 
    container="trimmomatic" \ 
    about.summary="flexible read trimming tool for Illumina NGS data" \ 
    about.home="http://www.usadellab.org/cms/index.php?page=trimmomatic" \ 
    software.version="0.36dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="trimmomatic" \ 
    about.copyright=" 2009-2011 Bjoern Usadel <usadel@mpimp-golm.mpg.de>," \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/trimmomatic/copyright" \ 
    extra.binaries="/usr/bin/TrimmomaticPE,/usr/bin/TrimmomaticSE" \ 
    extra.identifiers.conda="trimmomatic" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y trimmomatic && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
