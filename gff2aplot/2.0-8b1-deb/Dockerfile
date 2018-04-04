FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gff2aplot" \ 
    container="gff2aplot" \ 
    about.summary="pair-wise alignment-plots for genomic sequences in PostScript" \ 
    about.home="http://genome.imim.es/software/gfftools/GFF2APLOT.html" \ 
    software.version="2.0-8b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/gff2aplot/copyright" \ 
    extra.binaries="/usr/bin/ali2gff,/usr/bin/blat2gff,/usr/bin/gff2aplot,/usr/bin/parseblast,/usr/bin/sim2gff" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:perl, interface::commandline, interface::shell,:program, scope::utility, use::converting, use::viewing,:plaintext,:postscript,:TODO,:image:vector" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y gff2aplot && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
