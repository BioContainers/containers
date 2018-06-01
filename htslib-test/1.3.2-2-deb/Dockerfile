FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="htslib-test" \ 
    container="htslib-test" \ 
    about.summary="Test data for HTSlib" \ 
    about.home="https://github.com/samtools/htslib" \ 
    software.version="1.3.2-2-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="htslib" \ 
    about.copyright=" 2012-2016 Genome Research Ltd." \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/htslib-test/copyright" \ 
    about.tags="role::shared-lib" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y htslib-test && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
