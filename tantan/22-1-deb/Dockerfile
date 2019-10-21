FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tantan" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tantan" \ 
    about.summary="low complexity and tandem repeat masker for biosequences" \ 
    about.home="http://www.cbrc.jp/tantan/" \ 
    software.version="22-1-deb" \ 
    upstream.version="22" \ 
    version="1" \ 
    about.copyright=" 2010 Martin Frith <tantan@cbrc.jp>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/tantan/copyright" \ 
    extra.binaries="/usr/bin/tantan" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tantan || apt-get install -y tantan) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
