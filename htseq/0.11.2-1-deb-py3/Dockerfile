FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="htseq" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="htseq" \ 
    about.summary="Python3 high-throughput genome sequencing read analysis utilities" \ 
    about.home="http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html" \ 
    software.version="0.11.2-1-deb-py3" \ 
    upstream.version="0.11.2" \ 
    version="1" \ 
    extra.identifiers.biotools="htseq" \ 
    about.copyright="2010-2018 Simon Anders" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/htseq/copyright" \ 
    extra.binaries="/usr/bin/htseq-count,/usr/bin/htseq-qa" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y python3-htseq || apt-get install -y python3-htseq) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
