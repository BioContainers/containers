FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ariba" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ariba" \ 
    about.summary="Antibiotic Resistance Identification By Assembly" \ 
    about.home="https://github.com/sanger-pathogens/ariba" \ 
    software.version="2.13.3ds-1-deb" \ 
    upstream.version="2.13.3" \ 
    version="1" \ 
    about.copyright=" 2014-2016 Genome Research Ltd <path-help@sanger.ac.uk>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/ariba/copyright" \ 
    extra.binaries="/usr/bin/ariba" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:python, interface::commandline, role::program,:application, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ariba || apt-get install -y ariba) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
