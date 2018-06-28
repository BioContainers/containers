FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="primer3" \ 
    container="primer3" \ 
    about.summary="tool to design flanking oligo nucleotides for DNA amplification" \ 
    about.home="http://primer3.sourceforge.net" \ 
    software.version="2.3.7-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="primer3" \ 
    about.copyright=" 1996,1997,1998,1999,2000,2001,2004,2006,2007,2008,2009,2010,2011,2012" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/primer3/copyright" \ 
    extra.binaries="/usr/bin/ntdpal,/usr/bin/ntthal,/usr/bin/oligotm,/usr/bin/primer3_core" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y primer3 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
