FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proda" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="proda" \ 
    about.summary="multiple alignment of protein sequences" \ 
    about.home="http://proda.stanford.edu/" \ 
    software.version="1.0-12-deb" \ 
    upstream.version="1.0" \ 
    version="1" \ 
    extra.identifiers.biotools="proda" \ 
    about.copyright=" 2006, Phuong Tu Minh <phuongtm@fpt.com.vn>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/proda/copyright" \ 
    extra.binaries="/usr/bin/proda" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:utility, use::analysing, use::comparing,:plaintext, works-with::TODO" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y proda || apt-get install -y proda) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
