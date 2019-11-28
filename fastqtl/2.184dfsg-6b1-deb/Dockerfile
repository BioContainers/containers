FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="fastqtl" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="fastqtl" \ 
    about.summary="Quantitative Trait Loci (QTL) mapper in cis for molecular phenotypes" \ 
    about.home="http://fastqtl.sourceforge.net/" \ 
    software.version="2.184dfsg-6b1-deb" \ 
    upstream.version="2.184" \ 
    version="1" \ 
    about.license="custom, see /usr/share/doc/fastqtl/copyright" \ 
    about.license_file="/usr/share/doc/fastqtl/copyright" \ 
    extra.binaries="/usr/bin/fastQTL" \ 
    about.tags="field::biology, field::biology:bioinformatics, interface::commandline,:program, use::analysing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y fastqtl || apt-get install -y fastqtl) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
