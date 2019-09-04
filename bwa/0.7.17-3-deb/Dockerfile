FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="bwa" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="bwa" \ 
    about.summary="Burrows-Wheeler Aligner" \ 
    about.home="http://bio-bwa.sourceforge.net/" \ 
    software.version="0.7.17-3-deb" \ 
    upstream.version="0.7.17" \ 
    version="1" \ 
    extra.identifiers.biotools="bwa" \ 
    about.copyright=" 2008 Genome Research Ltd (GRL)" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/bwa/copyright" \ 
    extra.binaries="/usr/bin/bwa" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c, interface::commandline, interface::text-mode,:program, use::analysing, use::comparing" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y bwa || apt-get install -y bwa) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
