FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="njplot" \ 
    container="njplot" \ 
    about.summary="phylogenetic tree drawing program" \ 
    about.home="http://pbil.univ-lyon1.fr/software/njplot" \ 
    software.version="2.4-7-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="njplot" \ 
    about.copyright=" 19962009 Manolo Gouy <mgouy@biomserv.univ-lyon1.fr>" \ 
    about.license="Artistic" \ 
    about.license_file="/usr/share/doc/njplot/copyright" \ 
    extra.binaries="/usr/bin/newicktops,/usr/bin/newicktotxt,/usr/bin/njplot,/usr/bin/unrooted" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:graphical,:x11, role::program, scope::utility,:motif, use::analysing, use::editing, use::organizing,:printing,:viewing, works-with-format::plaintext,:biological-sequence, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y njplot && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
