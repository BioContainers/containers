FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tantan" \ 
    container="tantan" \ 
    about.summary="low complexity and tandem repeat masker for biosequences" \ 
    about.home="http://www.cbrc.jp/tantan/" \ 
    software.version="13-4-deb" \ 
    version="1" \ 
    about.copyright=" 2010 Martin Frith <tantan@cbrc.jp>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/tantan/copyright" \ 
    extra.binaries="/usr/bin/tantan" \ 
    extra.identifiers.conda="tantan" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tantan && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
