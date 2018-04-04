FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-rrna-data" \ 
    container="ncbi-rrna-data" \ 
    about.summary="large rRNA BLAST databases distributed with the NCBI toolkit" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/" \ 
    software.version="6.1.20170106-2-deb" \ 
    version="1" \ 
    about.copyright="1996-2017 NCBI" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ncbi-rrna-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::data" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ncbi-rrna-data && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
