FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="tabix" \ 
    container="tabix" \ 
    about.summary="generic indexer for TAB-delimited genome position files" \ 
    about.home="https://github.com/samtools/htslib" \ 
    software.version="1.3.2-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="htslib" \ 
    about.copyright=" 2012-2016 Genome Research Ltd." \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/tabix/copyright" \ 
    extra.binaries="/usr/bin/bgzip,/usr/bin/htsfile,/usr/bin/tabix" \ 
    extra.identifiers.conda="tabix" \ 
    about.tags="role::program, works-with-format::html, works-with::text" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y tabix && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
