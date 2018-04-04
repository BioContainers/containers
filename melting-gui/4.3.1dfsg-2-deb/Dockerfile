FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="melting-gui" \ 
    container="melting-gui" \ 
    about.summary="graphical interface to compute the melting temperature of nucleic acid duplex" \ 
    about.home="http://www.ebi.ac.uk/compneur-srv/melting/" \ 
    software.version="4.3.1dfsg-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="melting" \ 
    about.copyright="19972009, Nicolas Le Novre   <lenov@ebi.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/melting-gui/copyright" \ 
    extra.binaries="/usr/bin/tkmelting" \ 
    about.tags="field::biology, field::biology:molecular, implemented-in::perl,:graphical,:x11, role::program, scope::utility,:tk, use::analysing, works-with::TODO, x11::application" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y melting-gui && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
