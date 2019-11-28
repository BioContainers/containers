FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tabix" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="tabix" \ 
    about.summary="generic indexer for TAB-delimited genome position files" \ 
    about.home="https://github.com/samtools/htslib" \ 
    software.version="1.9-11-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    extra.identifiers.biotools="htslib" \ 
    about.copyright=" 2012-2016 Genome Research Ltd." \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/tabix/copyright" \ 
    extra.binaries="/usr/bin/bgzip,/usr/bin/htsfile,/usr/bin/tabix" \ 
    about.tags="implemented-in::c, role::program, science::calculation,:calculating, works-with-format::html, works-with::text" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y tabix || apt-get install -y tabix) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
