FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="quorum" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="quorum" \ 
    about.summary="QUality Optimized Reads of genomic sequences" \ 
    about.home="https://github.com/gmarcais/Quorum" \ 
    software.version="1.1.1-2-deb" \ 
    upstream.version="1.1.1" \ 
    version="1" \ 
    about.copyright="2012-2016 Guillaume Marais <gmarcais@umd.edu>," \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/quorum/copyright" \ 
    extra.binaries="/usr/bin/merge_mate_pairs,/usr/bin/quorum,/usr/bin/quorum_create_database,/usr/bin/quorum_error_correct_reads,/usr/bin/split_mate_pairs" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y quorum || apt-get install -y quorum) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
