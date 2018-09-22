FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="phylip" \ 
    container="phylip" \ 
    about.summary="package of programs for inferring phylogenies" \ 
    about.home="http://evolution.genetics.washington.edu/phylip.html" \ 
    software.version="1-3.696dfsg-5-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="phylip" \ 
    about.copyright="1980-2014 Joe Felsenstein <joe@gs.washington.edu>," \ 
    about.license="BSD-2-clause" \ 
    about.license_file="/usr/share/doc/phylip/copyright" \ 
    extra.binaries="/usr/bin/DrawGram,/usr/bin/DrawTree,/usr/bin/phylip" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y phylip && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
