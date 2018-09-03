FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="acedb-other" \ 
    container="acedb-other" \ 
    about.summary="retrieval of DNA or protein sequences" \ 
    about.home="http://www.acedb.org/" \ 
    software.version="4.9.39dfsg.02-1-deb" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/acedb-other/copyright" \ 
    extra.binaries="/usr/bin/efetch" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::program,:utility" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y acedb-other && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
