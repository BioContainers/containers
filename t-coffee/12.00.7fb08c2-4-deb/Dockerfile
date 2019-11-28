FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="t-coffee" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="t-coffee" \ 
    about.summary="Multiple Sequence Alignment" \ 
    about.home="http://www.tcoffee.org/Projects_home_page/t_coffee_home_page.html" \ 
    software.version="12.00.7fb08c2-4-deb" \ 
    version="1" \ 
    about.copyright="Centre National de la Recherche Scientifique (CNRS)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/t-coffee/copyright" \ 
    extra.binaries="/usr/bin/t_coffee" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing,:comparing, works-with-format::TODO, works-with-format::plaintext,:TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y t-coffee || apt-get install -y t-coffee) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
