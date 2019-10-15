FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="miniasm" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="miniasm" \ 
    about.summary="ultrafast de novo assembler for long noisy DNA sequencing reads" \ 
    about.home="https://github.com/lh3/miniasm" \ 
    software.version="0.3dfsg-1-deb" \ 
    upstream.version="0.3" \ 
    version="1" \ 
    about.copyright=" 2015 Broad Institute <hengli@broadinstitute.org>" \ 
    about.license="MIT" \ 
    about.license_file="/usr/share/doc/miniasm/copyright" \ 
    extra.binaries="/usr/bin/miniasm" \ 
    about.tags="biology::nucleic-acids, field::biology, field::biology:bioinformatics,:c, interface::commandline, role::program,:calculation, use::calculating, use::comparing,:biological-sequence" 

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y miniasm || apt-get install -y miniasm) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
