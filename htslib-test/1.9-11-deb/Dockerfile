FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="htslib-test" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="htslib-test" \ 
    about.summary="Test data for HTSlib" \ 
    about.home="https://github.com/samtools/htslib" \ 
    software.version="1.9-11-deb" \ 
    upstream.version="1.9" \ 
    version="1" \ 
    extra.identifiers.biotools="htslib" \ 
    about.copyright=" 2012-2016 Genome Research Ltd." \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/htslib-test/copyright" \ 
    about.tags="role::shared-lib" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y htslib-test || apt-get install -y htslib-test) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
