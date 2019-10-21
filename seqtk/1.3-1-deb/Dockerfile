FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seqtk" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seqtk" \ 
    about.summary="Fast and lightweight tool for processing sequences in the FASTA or FASTQ format" \ 
    about.home="https://github.com/lh3/seqtk" \ 
    software.version="1.3-1-deb" \ 
    upstream.version="1.3" \ 
    version="1" \ 
    extra.identifiers.biotools="seqtk" \ 
    about.copyright=" 2008-2012 Heng Li <lh3@me.com>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/seqtk/copyright" \ 
    extra.binaries="/usr/bin/seqtk" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seqtk || apt-get install -y seqtk) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
