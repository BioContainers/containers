FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="t-coffee" \ 
    container="t-coffee" \ 
    about.summary="Multiple Sequence Alignment" \ 
    about.home="http://www.tcoffee.org/Projects_home_page/t_coffee_home_page.html" \ 
    software.version="11.00.8cbe486-5-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="t-coffee" \ 
    about.copyright="Centre National de la Recherche Scientifique (CNRS)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/t-coffee/copyright" \ 
    extra.binaries="/usr/bin/t_coffee" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::TODO, works-with-format::plaintext,:TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y t-coffee && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
