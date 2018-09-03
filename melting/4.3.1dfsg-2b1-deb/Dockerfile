FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="melting" \ 
    container="melting" \ 
    about.summary="compute the melting temperature of nucleic acid duplex" \ 
    about.home="http://www.ebi.ac.uk/compneur-srv/melting/" \ 
    software.version="4.3.1dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/melting/copyright" \ 
    extra.binaries="/usr/bin/melting" \ 
    about.tags="field::biology, field::biology:molecular, implemented-in::c,:commandline, role::program, scope::utility, suite::gnu,:analysing, works-with-format::plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y melting && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
