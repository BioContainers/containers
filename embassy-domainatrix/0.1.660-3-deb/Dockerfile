FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="embassy-domainatrix" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="embassy-domainatrix" \ 
    about.summary="Extra EMBOSS commands to handle domain classification file" \ 
    about.home="http://emboss.sourceforge.net/apps/cvs/embassy/index.html#DOMAINATRIX" \ 
    software.version="0.1.660-3-deb" \ 
    upstream.version="0.1.660" \ 
    version="1" \ 
    about.copyright="Alan Bleasby (ableasby@ebi.ac.uk)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/embassy-domainatrix/copyright" \ 
    extra.binaries="/usr/bin/cathparse,/usr/bin/domainnr,/usr/bin/domainreso,/usr/bin/domainseqs,/usr/bin/domainsse,/usr/bin/scopparse,/usr/bin/ssematch" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, suite::TODO,:analysing,:converting,:editing,:searching,:TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y embassy-domainatrix || apt-get install -y embassy-domainatrix) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
