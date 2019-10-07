FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="melting" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="melting" \ 
    about.summary="compute the melting temperature of nucleic acid duplex" \ 
    about.home="http://www.ebi.ac.uk/compneur-srv/melting/" \ 
    software.version="5.2.0-1-deb" \ 
    upstream.version="5.2.0" \ 
    version="1" \ 
    extra.identifiers.biotools="melting" \ 
    about.copyright="19972009, Nicolas Le Novre   <lenov@ebi.ac.uk>" \ 
    about.license="GPL-2+" \ 
    about.license_file="/usr/share/doc/melting/copyright" \ 
    extra.binaries="/usr/bin/melting" \ 
    about.tags="field::biology, field::biology:bioinformatics, field::biology:molecular,:c, interface::commandline, role::program,:utility, suite::gnu, use::analysing,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y melting || apt-get install -y melting) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
