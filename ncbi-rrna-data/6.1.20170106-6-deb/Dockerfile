FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="ncbi-rrna-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="ncbi-rrna-data" \ 
    about.summary="large rRNA BLAST databases distributed with the NCBI toolkit" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/" \ 
    software.version="6.1.20170106-6-deb" \ 
    upstream.version="6.1.20170106" \ 
    version="1" \ 
    about.copyright="1996-2017 NCBI" \ 
    about.license="public_domain" \ 
    about.license_file="/usr/share/doc/ncbi-rrna-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, role::data" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y ncbi-rrna-data || apt-get install -y ncbi-rrna-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
