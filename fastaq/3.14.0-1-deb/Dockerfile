FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastaq" \ 
    container="fastaq" \ 
    about.summary="FASTA and FASTQ file manipulation tools" \ 
    about.home="https://github.com/sanger-pathogens/Fastaq" \ 
    software.version="3.14.0-1-deb" \ 
    version="1" \ 
    about.copyright=" 2012-2015 Martin Hunt <mh12@sanger.ac.uk>" \ 
    about.license="GPL-3" \ 
    about.license_file="/usr/share/doc/fastaq/copyright" \ 
    extra.binaries="/usr/bin/fastaq" \ 
    about.tags="biology::format:fasta, biology::nucleic-acids, field::biology,:biology:bioinformatics, implemented-in::python,:commandline, role::program, scope::utility, use::analysing,:calculating,:checking,:converting,:filtering,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastaq && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
