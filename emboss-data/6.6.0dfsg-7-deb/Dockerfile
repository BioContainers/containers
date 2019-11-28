FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="emboss-data" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="emboss-data" \ 
    about.summary="data files for the EMBOSS package" \ 
    about.home="http://emboss.sourceforge.net" \ 
    software.version="6.6.0dfsg-7-deb" \ 
    upstream.version="6.6.0" \ 
    version="1" \ 
    extra.identifiers.biotools="emboss" \ 
    about.copyright="The EMBOSS developers or their employers." \ 
    about.license="emboss" \ 
    about.license_file="/usr/share/doc/emboss-data/copyright" \ 
    about.tags="field::biology, field::biology:bioinformatics, made-of::TODO,:app-data" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y emboss-data || apt-get install -y emboss-data) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
