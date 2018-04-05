FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="embassy-domsearch" \ 
    container="embassy-domsearch" \ 
    about.summary="Extra EMBOSS commands to search for protein domains" \ 
    about.home="http://emboss.sourceforge.net/apps/cvs/embassy/index.html#DOMSEARCH" \ 
    software.version="1-0.1.660-1-deb" \ 
    version="1" \ 
    about.copyright="Jon Ison (jison@ebi.ac.uk)" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/embassy-domsearch/copyright" \ 
    extra.binaries="/usr/bin/seqfraggle,/usr/bin/seqnr,/usr/bin/seqsearch,/usr/bin/seqsort,/usr/bin/seqwords" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y embassy-domsearch && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
