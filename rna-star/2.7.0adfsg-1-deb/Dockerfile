FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="rna-star" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="rna-star" \ 
    about.summary="ultrafast universal RNA-seq aligner" \ 
    about.home="https://github.com/alexdobin/STAR/" \ 
    software.version="2.7.0adfsg-1-deb" \ 
    version="1" \ 
    about.copyright="2009-2019 Alexander Dobin <dobin@cshl.edu>" \ 
    about.license="GPL-3+" \ 
    about.license_file="/usr/share/doc/rna-star/copyright" \ 
    extra.binaries="/usr/bin/STAR" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c++, role::program, use::analysing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y rna-star || apt-get install -y rna-star) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
