FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sigma-align" \ 
    container="sigma-align" \ 
    about.summary="Simple greedy multiple alignment of non-coding DNA sequences" \ 
    about.home="http://www.imsc.res.in/~rsidd/sigma/" \ 
    software.version="1.1.3-4b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/sigma-align/copyright" \ 
    extra.binaries="/usr/bin/sigma" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y sigma-align && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
