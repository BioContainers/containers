FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="biosquid" \ 
    container="biosquid" \ 
    about.summary="utilities for biological sequence analysis" \ 
    about.home="http://eddylab.org/software.html" \ 
    software.version="1.9gcvs20050121-7-deb" \ 
    version="1" \ 
    about.copyright="1992-2006 Sean Eddy <eddy@genetics.wustl.edu>" \ 
    about.license="GPL-2" \ 
    about.license_file="/usr/share/doc/biosquid/copyright" \ 
    extra.binaries="/usr/bin/afetch,/usr/bin/alistat,/usr/bin/compalign,/usr/bin/compstruct,/usr/bin/revcomp,/usr/bin/seqsplit,/usr/bin/seqstat,/usr/bin/sfetch,/usr/bin/shuffle,/usr/bin/sindex,/usr/bin/sreformat,/usr/bin/stranslate,/usr/bin/weight" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::comparing,:converting,:editing, works-with-format::TODO,:TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y biosquid && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
