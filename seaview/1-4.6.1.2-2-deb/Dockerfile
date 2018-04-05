FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seaview" \ 
    container="seaview" \ 
    about.summary="Multiplatform interface for sequence alignment and phylogeny" \ 
    about.home="http://doua.prabi.fr/software/seaview" \ 
    software.version="1-4.6.1.2-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="seaview" \ 
    about.copyright="1996-2014 Manolo Gouy <mgouy@biomserv.univ-lyon1.fr>" \ 
    about.license="GPL-3+ with PHYLIP exception" \ 
    about.license_file="/usr/share/doc/seaview/copyright" \ 
    extra.binaries="/usr/bin/seaview" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:c++, interface::graphical, interface::x11,:client, protocol::TODO, role::program, scope::utility,:fltk, use::TODO, use::comparing, use::editing,:printing,:viewing, works-with-format::plaintext,:biological-sequence, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y seaview && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
