FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="canu" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="canu" \ 
    about.summary="single molecule sequence assembler for genomes" \ 
    about.home="http://canu.readthedocs.org/en/latest/" \ 
    software.version="1.8dfsg-2-deb" \ 
    upstream.version="1.8" \ 
    version="1" \ 
    extra.identifiers.biotools="canu" \ 
    about.copyright="" \ 
    about.license="GPL-2.0+ and BSD-3-Clause-BNBI and Public-Domain" \ 
    about.license_file="/usr/share/doc/canu/copyright" \ 
    extra.binaries="/usr/bin/canu" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y canu || apt-get install -y canu) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
