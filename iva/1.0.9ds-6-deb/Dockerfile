FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="iva" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="iva" \ 
    about.summary="iterative virus sequence assembler" \ 
    about.home="https://github.com/sanger-pathogens/iva" \ 
    software.version="1.0.9ds-6-deb" \ 
    upstream.version="1.0.9" \ 
    version="1" \ 
    extra.identifiers.biotools="iva" \ 
    about.copyright=" 2014-2015 Genome Research Limited" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/iva/copyright" \ 
    extra.binaries="/usr/bin/iva,/usr/bin/iva_qc,/usr/bin/iva_qc_make_db" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:python, interface::commandline, role::program,:biological-sequence,:file" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y iva || apt-get install -y iva) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
