FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="beagle" \ 
    container="beagle" \ 
    about.summary="Genotype calling, genotype phasing and imputation of ungenotyped markers" \ 
    about.home="https://faculty.washington.edu/browning/beagle/beagle.html" \ 
    software.version="4.1160727-86adfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="beagle" \ 
    about.copyright="2013-2016 Brian L. Browning" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/beagle/copyright" \ 
    extra.binaries="/usr/bin/beagle,/usr/bin/bref" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::java,:commandline, role::program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y beagle && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
