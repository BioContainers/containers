FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="sibsim4" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="sibsim4" \ 
    about.summary="align expressed RNA sequences on a DNA template" \ 
    about.home="http://sibsim4.sourceforge.net/" \ 
    software.version="0.20-4-deb" \ 
    upstream.version="0.20" \ 
    version="1" \ 
    extra.identifiers.biotools="sibsim4" \ 
    about.copyright=" 2001-2010 Christian Iseli <Christian.Iseli@licr.org>," \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/sibsim4/copyright" \ 
    extra.binaries="/usr/bin/SIBsim4" \ 
    about.tags="field::biology, field::biology:bioinformatics, implemented-in::c,:commandline, role::program, scope::utility, use::TODO,:comparing,:searching, works-with-format::TODO,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y sibsim4 || apt-get install -y sibsim4) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
