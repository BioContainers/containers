FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="proda" \ 
    container="proda" \ 
    about.summary="multiple alignment of protein sequences" \ 
    about.home="http://proda.stanford.edu/" \ 
    software.version="1.0-10-deb" \ 
    version="1" \ 
    extra.identifiers.biotools="proda" \ 
    about.copyright=" 2006, Phuong Tu Minh <phuongtm@fpt.com.vn>" \ 
    about.license="PD" \ 
    about.license_file="/usr/share/doc/proda/copyright" \ 
    extra.binaries="/usr/bin/proda" \ 
    about.tags="biology::peptidic, field::biology, field::biology:bioinformatics,:c++, interface::commandline, role::program,:utility, use::analysing, use::comparing,:plaintext, works-with::TODO" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y proda && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
