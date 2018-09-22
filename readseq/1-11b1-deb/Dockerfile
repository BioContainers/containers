FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="readseq" \ 
    container="readseq" \ 
    about.summary="Conversion between sequence formats" \ 
    about.home="http://iubio.bio.indiana.edu/soft/molbio/readseq/" \ 
    software.version="1-11b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/readseq/copyright" \ 
    extra.binaries="/usr/bin/readseq" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::converting,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y readseq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
