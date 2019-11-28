FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="readseq" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="readseq" \ 
    about.summary="Conversion between sequence formats" \ 
    about.home="http://iubio.bio.indiana.edu/soft/molbio/readseq/" \ 
    software.version="1-13-deb" \ 
    upstream.version="1" \ 
    version="1" \ 
    extra.identifiers.biotools="readseq" \ 
    about.copyright="1990-1993 D. Gilbert <gilbertd@bio.indiana.edu>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/readseq/copyright" \ 
    extra.binaries="/usr/bin/readseq" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::converting,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y readseq || apt-get install -y readseq) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
