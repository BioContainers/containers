FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastqtl" \ 
    container="fastqtl" \ 
    about.summary="Quantitative Trait Loci (QTL) mapper in cis for molecular phenotypes" \ 
    about.home="http://fastqtl.sourceforge.net/" \ 
    software.version="2.184dfsg-5-deb" \ 
    version="1" \ 
    about.copyright="2014-2015 Olivier Delaneau, Alfonso Buil and Emmanouil T. Dermitzakis" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/fastqtl/copyright" \ 
    extra.binaries="/usr/bin/fastQTL" \ 
    about.tags="field::biology, field::biology:bioinformatics, interface::commandline,:program, use::analysing" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y fastqtl && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
