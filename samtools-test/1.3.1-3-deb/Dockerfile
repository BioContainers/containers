FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="samtools-test" \ 
    container="samtools-test" \ 
    about.summary="test files for the samtools package" \ 
    about.home="http://www.htslib.org/" \ 
    software.version="1.3.1-3-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="samtools" \ 
    about.copyright=" 20082016, Genome Research Ltd. (GRL)" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/samtools-test/copyright" \ 
    about.tags=""

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y samtools-test && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
