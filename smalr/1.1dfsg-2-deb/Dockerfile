FROM biocontainers/biocontainers:vdebian-buster-backports_cv1
MAINTAINER biocontainers <biodocker@gmail.com>
LABEL    software="smalr" \ 
    base_image="biocontainers/biocontainers:vdebian-buster-backports_cv1" \ 
    container="smalr" \ 
    about.summary="interrogation of the methylation status of nucleotide sequencing reads" \ 
    about.home="https://github.com/fanglab/SMALR" \ 
    software.version="1.1dfsg-2-deb" \ 
    upstream.version="1.1" \ 
    version="1" \ 
    about.copyright="2015-2017 John Beaulaurier" \ 
    about.license="BSD-3-Clause" \ 
    about.license_file="/usr/share/doc/smalr/copyright" \ 
    extra.binaries="/usr/bin/smalr" \ 
    about.tags=""

USER root
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && (apt-get install -t buster-backports -y smalr || apt-get install -y smalr) && apt-get clean && apt-get purge && rm -rf /var/lib/apt/lists/* /tmp/*
USER biodocker
