FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="transtermhp" \ 
    container="transtermhp" \ 
    about.summary="find rho-independent transcription terminators in bacterial genomes" \ 
    about.home="http://transterm.cbcb.umd.edu/" \ 
    software.version="2.09-3b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/transtermhp/copyright" \ 
    extra.binaries="/usr/bin/2ndscore,/usr/bin/transterm" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y transtermhp && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
