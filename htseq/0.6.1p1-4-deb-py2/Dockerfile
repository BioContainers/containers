FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="htseq" \ 
    container="htseq" \ 
    about.summary="high-throughput genome sequencing read analysis utilities" \ 
    about.home="http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html" \ 
    software.version="0.6.1p1-4-deb-py2" \ 
    version="1" \ 
    extra.identifiers.biotools="htseq" \ 
    about.copyright="2010 Simon Anders" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/htseq/copyright" \ 
    extra.binaries="/usr/bin/htseq-count,/usr/bin/htseq-qa" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y python-htseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
