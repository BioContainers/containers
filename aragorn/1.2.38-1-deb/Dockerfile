FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="aragorn" \ 
    container="aragorn" \ 
    about.summary="tRNA and tmRNA detection in nucleotide sequences" \ 
    about.home="http://mbio-serv2.mbioekol.lu.se/ARAGORN/" \ 
    software.version="1.2.38-1-deb" \ 
    version="1" \ 
    about.copyright="2003-2015 Dean Laslett <gaiaquark@gmail.com>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/aragorn/copyright" \ 
    extra.binaries="/usr/bin/aragorn" \ 
    extra.identifiers.conda="aragorn" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:searching, works-with-format::plaintext,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y aragorn && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
