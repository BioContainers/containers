FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="embassy-domalign" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="embassy-domalign" \ 
    about.summary="Extra EMBOSS commands for protein domain alignment" \ 
    about.home="http://emboss.sourceforge.net/apps/cvs/embassy/index.html#DOMALIGN" \ 
    software.version="0.1.660-3-deb" \ 
    upstream.version="0.1.660" \ 
    version="1" \ 
    about.copyright="" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/embassy-domalign/copyright" \ 
    extra.binaries="/usr/bin/allversusall,/usr/bin/domainalign,/usr/bin/domainrep,/usr/bin/seqalign" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, suite::TODO,:analysing,:comparing,:editing, works-with-format::TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y embassy-domalign || apt-get install -y embassy-domalign) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
