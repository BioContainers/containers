FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="transtermhp" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="transtermhp" \ 
    about.summary="find rho-independent transcription terminators in bacterial genomes" \ 
    about.home="http://transterm.cbcb.umd.edu/" \ 
    software.version="2.09-4-deb" \ 
    upstream.version="2.09" \ 
    version="1" \ 
    about.copyright="Carl Kingsford carlk@umiacs.umd.edu" \ 
    about.license="GPL-2.0+" \ 
    about.license_file="/usr/share/doc/transtermhp/copyright" \ 
    extra.binaries="/usr/bin/2ndscore,/usr/bin/transterm" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y transtermhp || apt-get install -y transtermhp) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
