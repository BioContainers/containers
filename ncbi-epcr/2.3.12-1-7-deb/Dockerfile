FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-epcr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-epcr" \ 
    about.summary="Tool to test a DNA sequence for the presence of sequence tagged sites" \ 
    about.home="https://www.ncbi.nlm.nih.gov/tools/epcr/" \ 
    software.version="2.3.12-1-7-deb" \ 
    upstream.version="2.3.12" \ 
    version="1" \ 
    about.copyright="nobody" \ 
    about.license="public-domain" \ 
    about.license_file="/usr/share/doc/ncbi-epcr/copyright" \ 
    extra.binaries="/usr/bin/e-PCR,/usr/bin/fahash,/usr/bin/famap,/usr/bin/re-PCR" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, scope::utility, use::checking,:searching, works-with-format::plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-epcr || apt-get install -y ncbi-epcr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
