FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastahack" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastahack" \ 
    about.summary="utility for indexing and sequence extraction from FASTA files" \ 
    about.home="https://github.com/ekg/fastahack" \ 
    software.version="0.0git20160702.bbc645fdfsg-6-deb" \ 
    upstream.version="0.0" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/fastahack/copyright" \ 
    about.license_file="/usr/share/doc/fastahack/copyright" \ 
    extra.binaries="/usr/bin/fastahack" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastahack || apt-get install -y fastahack) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
