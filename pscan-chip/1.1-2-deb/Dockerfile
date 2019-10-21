FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="pscan-chip" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="pscan-chip" \ 
    about.summary="ChIP-based identifcation of TF binding sites" \ 
    about.home="http://www.beaconlab.it/pscan_chip_dev/" \ 
    software.version="1.1-2-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    extra.identifiers.biotools="pscan-chip" \ 
    about.copyright="2013 Federico Zambelli <f.zambelli@ibiom.cnr.it>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/pscan-chip/copyright" \ 
    extra.binaries="/usr/bin/fasta_to_raw,/usr/bin/pscan_chip" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y pscan-chip || apt-get install -y pscan-chip) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
