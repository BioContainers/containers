FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="seaview" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="seaview" \ 
    about.summary="Multiplatform interface for sequence alignment and phylogeny" \ 
    about.home="http://doua.prabi.fr/software/seaview" \ 
    software.version="1-4.7-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="seaview" \ 
    about.copyright="1996-2014 Manolo Gouy <mgouy@biomserv.univ-lyon1.fr>" \ 
    about.license="GPL-3+ with PHYLIP exception" \ 
    about.license_file="/usr/share/doc/seaview/copyright" \ 
    extra.binaries="/usr/bin/seaview" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:c++, interface::commandline, interface::graphical,:x11, network::client, protocol::TODO, role::program,:utility, uitoolkit::fltk, use::TODO, use::comparing,:editing,:printing,:viewing,:plaintext, works-with::biological-sequence,:application" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y seaview || apt-get install -y seaview) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
