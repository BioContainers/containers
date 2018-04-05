FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="clustalx" \ 
    container="clustalx" \ 
    about.summary="Multiple alignment of nucleic acid and protein sequences (graphical interface)" \ 
    about.home="http://www.clustal.org/clustal2/" \ 
    software.version="2.1lgpl-5-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="clustalx" \ 
    about.copyright=" Des Higgins, Julie Thompson and Toby Gibson" \ 
    about.license="LGPL-3+" \ 
    about.license_file="/usr/share/doc/clustalx/copyright" \ 
    extra.binaries="/usr/bin/clustalx" \ 
    about.tags="biology::format:aln, biology::peptidic, field::biology,:biology:bioinformatics, implemented-in::c, interface::graphical,:x11, role::program, scope::utility, uitoolkit::motif,:analysing,:comparing,:viewing,:plaintext, works-with::TODO, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y clustalx && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
