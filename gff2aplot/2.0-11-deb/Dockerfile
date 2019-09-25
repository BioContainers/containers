FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gff2aplot" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gff2aplot" \ 
    about.summary="pair-wise alignment-plots for genomic sequences in PostScript" \ 
    about.home="http://genome.imim.es/software/gfftools/GFF2APLOT.html" \ 
    software.version="2.0-11-deb" \ 
    upstream.version="2.0" \ 
    version="1" \ 
    extra.identifiers.biotools="gff2aplot" \ 
    about.copyright="1999-2003 Josep Francesc ABRIL FERRANDO <jabril@imim.es>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gff2aplot/copyright" \ 
    extra.binaries="/usr/bin/ali2gff,/usr/bin/blat2gff,/usr/bin/gff2aplot,/usr/bin/parseblast,/usr/bin/sim2gff" \ 
    about.tags="devel::lang:perl, devel::library, field::biology,:biology:bioinformatics, implemented-in::c, implemented-in::perl,:commandline,:shell, role::devel-lib,:program, scope::utility, use::converting, use::viewing,:plaintext,:postscript,:TODO,:image,:image:vector,:text" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gff2aplot || apt-get install -y gff2aplot) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
