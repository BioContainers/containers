FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="njplot" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="njplot" \ 
    about.summary="phylogenetic tree drawing program" \ 
    about.home="http://pbil.univ-lyon1.fr/software/njplot" \ 
    software.version="2.4-8-deb" \ 
    upstream.version="2.4" \ 
    version="1" \ 
    extra.identifiers.biotools="njplot" \ 
    about.copyright=" 19962009 Manolo Gouy <mgouy@biomserv.univ-lyon1.fr>" \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/njplot/copyright" \ 
    extra.binaries="/usr/bin/newicktops,/usr/bin/newicktotxt,/usr/bin/njplot,/usr/bin/unrooted" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline,:graphical,:x11,:program, scope::utility, uitoolkit::motif, use::analysing,:editing,:organizing,:printing,:viewing,:plaintext, works-with::biological-sequence,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y njplot || apt-get install -y njplot) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
