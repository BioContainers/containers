FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="augustus" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="augustus" \ 
    about.summary="gene prediction in eukaryotic genomes" \ 
    about.home="http://bioinf.uni-greifswald.de/augustus/" \ 
    software.version="3.3.2dfsg-2-deb" \ 
    upstream.version="3.3.2" \ 
    version="1" \ 
    extra.identifiers.biotools="augustus" \ 
    about.copyright=" 2004-2016 Lizzy Gerischer, Oliver Keller, Stefanie Knig," \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/augustus/copyright" \ 
    extra.binaries="/usr/bin/aln2wig,/usr/bin/augustus,/usr/bin/bam2hints,/usr/bin/bam2wig,/usr/bin/checkTargetSortedness,/usr/bin/compileSpliceCands,/usr/bin/etraining,/usr/bin/fastBlockSearch,/usr/bin/filterBam,/usr/bin/homGeneMapping,/usr/bin/joingenes,/usr/bin/prepareAlign" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline, role::program, science::calculation,:utility, uitoolkit::ncurses, use::analysing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y augustus || apt-get install -y augustus) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
