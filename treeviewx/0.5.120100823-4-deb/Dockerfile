FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="treeviewx" \ 
    container="treeviewx" \ 
    about.summary="Displays and prints phylogenetic trees" \ 
    about.home="http://darwin.zoology.gla.ac.uk/~rpage/treeviewx/" \ 
    software.version="0.5.120100823-4-deb" \ 
    version="1" \ 
    about.copyright=" 2001 Roderic D. M. Page <r.page@bio.gla.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/treeviewx/copyright" \ 
    extra.binaries="/usr/bin/tv" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:graphical,:x11, role::program, scope::utility,:wxwidgets, use::viewing, works-with-format::pdf,:plaintext,:postscript,:svg, works-with::TODO, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y treeviewx && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
