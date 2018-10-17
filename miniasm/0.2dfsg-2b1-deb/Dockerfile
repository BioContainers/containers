FROM biocontainers/biocontainers:debian-stretch-backports
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="miniasm" \ 
    container="miniasm" \ 
    about.summary="ultrafast de novo assembler for long noisy DNA sequencing reads" \ 
    about.home="https://github.com/lh3/miniasm" \ 
    software.version="0.2dfsg-2b1-deb" \ 
    version="1" \ 
    about.license_file="/usr/share/doc/miniasm/copyright" \ 
    extra.binaries="/usr/bin/miniasm" \ 
    extra.identifiers.conda="miniasm" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:calculation, use::calculating, use::comparing,:biological-sequence" 

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y miniasm && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
