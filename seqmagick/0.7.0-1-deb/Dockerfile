FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqmagick" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seqmagick" \ 
    about.summary="imagemagick-like frontend to Biopython SeqIO" \ 
    about.home="https://github.com/fhcrc/seqmagick/" \ 
    software.version="0.7.0-1-deb" \ 
    upstream.version="0.7.0" \ 
    version="1" \ 
    about.copyright="2014-2017 Matsen Group" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/seqmagick/copyright" \ 
    extra.binaries="/usr/bin/seqmagick" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seqmagick || apt-get install -y seqmagick) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
