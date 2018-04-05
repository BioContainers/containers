FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="blast2" \ 
    container="blast2" \ 
    about.summary="transitional dummy package to ncbi-blast+-legacy" \ 
    about.home="http://www.ncbi.nlm.nih.gov/IEB/ToolBox/CPP_DOC/" \ 
    software.version="1-2.6.0-1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/blast2/copyright" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:calculation, scope::utility, use::searching,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y blast2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
