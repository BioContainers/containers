FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="augustus" \ 
    container="augustus" \ 
    about.summary="gene prediction in eukaryotic genomes" \ 
    about.home="http://bioinf.uni-greifswald.de/augustus/" \ 
    software.version="3.2.3dfsg-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="augustus" \ 
    about.copyright=" 2004-2016 Lizzy Gerischer, Oliver Keller, Stefanie Knig," \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/augustus/copyright" \ 
    extra.binaries="/usr/bin/augustus,/usr/bin/bam2hints,/usr/bin/checkTargetSortedness,/usr/bin/etraining,/usr/bin/fastBlockSearch,/usr/bin/filterBam,/usr/bin/homGeneMapping,/usr/bin/joingenes,/usr/bin/prepareAlign" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, science::calculation,:utility, use::analysing, works-with::biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y augustus && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
