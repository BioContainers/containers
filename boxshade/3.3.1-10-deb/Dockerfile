FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="boxshade" \ 
    container="boxshade" \ 
    about.summary="Pretty-printing of multiple sequence alignments" \ 
    about.home="http://www.ch.embnet.org/software/BOX_form.html" \ 
    software.version="3.3.1-10-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="boxshade" \ 
    about.copyright="The authors or their employers, or maybe no copyright at all" \ 
    about.license="public-domain-claim" \ 
    about.license_file="/usr/share/doc/boxshade/copyright" \ 
    extra.binaries="/usr/bin/boxshade" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:typesetting, works-with-format::html,:plaintext,:postscript,:tex, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y boxshade && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
