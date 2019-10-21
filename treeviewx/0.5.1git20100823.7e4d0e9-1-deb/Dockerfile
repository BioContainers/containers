FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="treeviewx" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="treeviewx" \ 
    about.summary="Displays and prints phylogenetic trees" \ 
    about.home="https://github.com/rdmpage/treeviewx" \ 
    software.version="0.5.1git20100823.7e4d0e9-1-deb" \ 
    upstream.version="0.5.1" \ 
    version="1" \ 
    about.copyright=" 2001 Roderic D. M. Page <r.page@bio.gla.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/treeviewx/copyright" \ 
    extra.binaries="/usr/bin/tv" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c++,:commandline,:graphical,:x11,:program, scope::utility, uitoolkit::wxwidgets, use::viewing,:pdf,:plaintext,:postscript,:svg,:TODO,:text, x11::application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y treeviewx || apt-get install -y treeviewx) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
