FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="gff2ps" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="gff2ps" \ 
    about.summary="produces PostScript graphical output from GFF-files" \ 
    about.home="http://genome.imim.es/software/gfftools/GFF2PS.html" \ 
    software.version="0.98l-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="gff2ps" \ 
    about.copyright="1999-2003 Josep Francesc ABRIL FERRANDO" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/gff2ps/copyright" \ 
    extra.binaries="/usr/bin/gff2ps" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::shell,:commandline, role::program, scope::utility, use::converting,:viewing, works-with-format::postscript, works-with::TODO,:image,:image:vector,:text" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y gff2ps || apt-get install -y gff2ps) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
