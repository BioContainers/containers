FROM debian:trixie-slim
MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="trimmomatic" \ 
    base_image="debian:trixie-slim" \ 
    container="trimmomatic" \ 
    about.summary="flexible read trimming tool for Illumina NGS data" \ 
    about.home="http://www.usadellab.org/cms/index.php?page=trimmomatic" \ 
    software.version="0.39+dfsg-2" \ 
    upstream.version="0.39" \ 
    version="1" \ 
    extra.identifiers.biotools="trimmomatic" \ 
    about.copyright=" 2009-2011 Bjoern Usadel <usadel@mpimp-golm.mpg.de>," \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/trimmomatic/copyright" \ 
    extra.binaries="/usr/bin/TrimmomaticPE,/usr/bin/TrimmomaticSE" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y trimmomatic=0.39+dfsg-2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
