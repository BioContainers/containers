FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="iva" \ 
    container="iva" \ 
    about.summary="iterative virus sequence assembler" \ 
    about.home="https://github.com/sanger-pathogens/iva" \ 
    software.version="1.0.8ds-1-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="iva" \ 
    about.copyright=" 2014-2015 Genome Research Limited" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/iva/copyright" \ 
    extra.binaries="/usr/bin/iva,/usr/bin/iva_qc,/usr/bin/iva_qc_make_db" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:python, interface::commandline, role::program,:biological-sequence,:file" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y iva && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
