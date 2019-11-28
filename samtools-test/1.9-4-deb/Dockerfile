FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="samtools-test" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="samtools-test" \ 
    about.summary="test files for the samtools package" \ 
    about.home="http://www.htslib.org/" \ 
    software.version="1.9-4-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    extra.identifiers.biotools="samtools" \ 
    about.copyright=" 20082016, Genome Research Ltd. (GRL)" \ 
    about.license="Expat" \ 
    about.license_file="/usr/share/doc/samtools-test/copyright" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y samtools-test || apt-get install -y samtools-test) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
