FROM debian:bookworm-slim

MAINTAINER Sebastian Bassi <sebastian@toyoko.io>
LABEL    software="bwa" \ 
    base_image="debian:bookworm-slim" \ 
    container="bwa" \ 
    about.summary="Burrows-Wheeler Aligner" \ 
    about.home="http://bio-bwa.sourceforge.net/" \ 
    software.version="0.7.17-7-deb" \ 
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
RUN apt-get update && apt-get install -y bwa=0.7.17-7+b2 && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
